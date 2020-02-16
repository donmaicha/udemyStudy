//
//  ViewController.swift
//  TableViewSample
//
//  Created by 福島拓希 on 2020/02/16.
//  Copyright © 2020 福島拓希. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    var box = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func countUp(_ sender: Any) {
        box += 1
        
        label.text = String(box)
        
        if box > 10 {
            // 画面遷移する
            let tableController: TableViewController1 = self.storyboard?.instantiateViewController(withIdentifier: "next") as! TableViewController1
            
            tableController.count = box
            self.navigationController?.pushViewController(tableController, animated: true)
        }
    }
    
}

