//
//  TransactionsViewModel.swift
//  PlatziFinanzas
//
//  Created by Andres Silva on 12/10/18.
//  Copyright © 2018 Platzi. All rights reserved.
//

import Foundation
import FirebaseFirestore
import FinanzasCore
import FirebaseAuth

protocol TransactionsViewModelDelegate {
    func reloadData()
}

class TransactionsViewModel {
    private var items: [FinanzasCore.Transaction] = []
    
    private var db: Firestore {
        let db = Firestore.firestore()
        let settings = db.settings
        settings.areTimestampsInSnapshotsEnabled = true
        settings.isPersistenceEnabled = true
        db.settings = settings
        return db
    }
    
    var numberOfitems: Int {
        return items.count
    }
    
    var delegate: TransactionsViewModelDelegate?
    
    init() {
        getdata()
        NotificationCenter.default.addObserver(self, selector: #selector(getdata), name: Notification.Name("AddedNewData"), object: nil)
    }
    
    @objc private func getdata() {
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        db.collection("transactions")
            .whereField("ownerId", isEqualTo: uid)
            .order(by: "date", descending: true)
            .addSnapshotListener { [weak self] (snapshot, error) in
                
                guard let self = self else { return }
                
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                
                self.items.removeAll()
                
                try? snapshot?.documents.forEach({ (snapshot) in
                    let json = snapshot.data()
                    let jsonData = try JSONSerialization.data(withJSONObject: json, options: [])
                    
                    guard let transaction = try? JSONDecoder().decode(Transaction.self, from: jsonData) else {
                        return
                    }
                    
                    transaction.firebaseId = snapshot.documentID
                    self.items.append(transaction)
                })
                
                self.delegate?.reloadData()
        }
    }
    
    func item(at indexPath: IndexPath) -> TransactionViewModel {
        return TransactionViewModel(transaction: items[indexPath.row])
    }
    
    func remove(at indexPath: IndexPath) {
        let item = items.remove(at: indexPath.row)
        guard let firebaseId = item.firebaseId else { return }
        db.collection("transactions").document(firebaseId).delete()
    }
}


class TransactionViewModel {
    private var transaction: FinanzasCore.Transaction
    
    var name: String {
        return transaction.name
    }
    
    var value: String {
        return transaction.value.currency()
    }
    
    var date: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        formatter.timeZone = TimeZone.current
        return formatter.string(from: transaction.date)
    }

    var time: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm"
        formatter.timeZone = TimeZone.current
        return formatter.string(from: transaction.date)
    }
    
    init(transaction: FinanzasCore.Transaction) {
        self.transaction = transaction
    }
}
