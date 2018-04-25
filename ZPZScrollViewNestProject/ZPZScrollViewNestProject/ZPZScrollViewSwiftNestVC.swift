//
//  ZPZScrollViewSwiftNestVC.swift
//  ZPZScrollViewNestProject
//
//  Created by zhoupengzu on 2018/4/25.
//  Copyright © 2018年 zhoupengzu. All rights reserved.
//

import UIKit

class ZPZScrollViewSwiftNestVC: UIViewController, UIScrollViewDelegate {

    private let bacScrollView = UIScrollView()
    private let childScrollView = UIScrollView()
    private let hScrollView = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
view.backgroundColor = .white
        // Do any additional setup after loading the view.
        configUI()
    }
    
    private func configUI() {
        bacScrollView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        bacScrollView.backgroundColor = .red
        bacScrollView.delegate = self
        bacScrollView.alwaysBounceVertical = true
        self.view .addSubview(bacScrollView)
        
        childScrollView.frame = CGRect(x: 0, y: 100, width: bacScrollView.frame.width, height: bacScrollView.frame.height)
        childScrollView.backgroundColor = .green
        childScrollView.delegate = self
        childScrollView.alwaysBounceVertical = true
        bacScrollView.addSubview(childScrollView)
        
        hScrollView.frame = CGRect(x: 0, y: 0, width: childScrollView.frame.width, height: childScrollView.frame.height)
        hScrollView.backgroundColor = .blue
        hScrollView.delegate = self
        hScrollView.isPagingEnabled = true
        hScrollView.contentSize = CGSize(width: 3 * hScrollView.frame.width, height: 0)
        childScrollView.addSubview(hScrollView)
        
        let view1 = UIView(frame: CGRect(x: 0, y: 0, width: hScrollView.frame.width, height: hScrollView.frame.height))
        view1.backgroundColor = .purple
        hScrollView.addSubview(view1)
        
        let view2 = UIView(frame: CGRect(x: hScrollView.frame.width, y: 0, width: hScrollView.frame.width, height: hScrollView.frame.height))
        view2.backgroundColor = .orange
        hScrollView.addSubview(view2)
        let view3 = UIView(frame: CGRect(x: hScrollView.frame.width * 2, y: 0, width: hScrollView.frame.width, height: hScrollView.frame.height))
        view3.backgroundColor = .yellow
        hScrollView.addSubview(view3)
        
        // 关键点
        bacScrollView.contentSize = CGSize(width: 0, height: childScrollView.frame.maxY)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        switch scrollView {
        case bacScrollView:
            print("bacScrollview offset:\(scrollView.contentOffset.y)")
        case childScrollView:
            print("childScrollview offset:\(scrollView.contentOffset.y)")
        case hScrollView:
            print("hScrollview offset:\(scrollView.contentOffset.y)")
        default:
            break
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
