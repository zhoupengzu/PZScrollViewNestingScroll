//
//  ViewController.swift
//  ZPZScrollViewNestProject
//
//  Created by zhoupengzu on 2018/4/25.
//  Copyright © 2018年 zhoupengzu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func gotoOCNest(_ sender: UIButton) {
        let nestVC = ZPZScrollViewOCNestVC()
        self.navigationController?.pushViewController(nestVC, animated: true)
    }
    
    @IBAction func gotoSwiftNest(_ sender: UIButton) {
        let nestVC = ZPZScrollViewSwiftNestVC()
        self.navigationController?.pushViewController(nestVC, animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

