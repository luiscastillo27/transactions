//
//  BudgetViewController.swift
//  Transaciones
//
//  Created by Luis on 2/21/19.
//  Copyright © 2019 Luis. All rights reserved.
//

import UIKit

class BudgetViewController: UIViewController {

    @IBOutlet weak var animationLayout: NSLayoutConstraint!
    @IBOutlet weak var table: UITableView!
    @IBOutlet var animationsButtons:[UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let cell = UINib(nibName: "TransactionsCell", bundle: Bundle.main)
        table.register(cell, forCellReuseIdentifier: "cell")
        animationLayout.constant = 35
    }
    
    @IBAction func buttonAnimate(_ sender: UIButton) {
        animationLayout.constant = sender.frame.origin.x + 35
        UIView.animate(withDuration: 0.5, animations: {
            self.view.layoutIfNeeded()
        }, completion: { complete in
            self.animationsButtons.forEach {
                $0.setTitleColor( UIColor(named: "TextColor"), for: .normal)
                sender.setTitleColor( UIColor.white, for: .normal)
            }
        })
    }
    

}

extension BudgetViewController: UITableViewDelegate {
    
}

extension BudgetViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = 27
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return table.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    }
}
