//
//  TwoEqualWidthViews.swift
//  demoAutoLayoutProgrammatically
//
//  Created by Intelivex Labs on 20/03/18.
//  Copyright © 2018 Intelivex Labs. All rights reserved.
//

import UIKit

class TwoEqualWidthViews: UIViewController {

    let view1 = UIView()
    let view2 = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        super.loadView()
        self.setUpUI()
    }
    
    func setUpUI() {
        self.view.addSubview(view1)
        view1.translatesAutoresizingMaskIntoConstraints = false
        view1.backgroundColor = .red
        
        self.view.addSubview(view2)
        view2.translatesAutoresizingMaskIntoConstraints = false
        view2.backgroundColor = .green
        
        let view1Leading = NSLayoutConstraint.init(item: view1, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1, constant: 0)
        
        let view2Leading = NSLayoutConstraint.init(item: view2, attribute: .leading, relatedBy: .equal, toItem: view1, attribute: .trailing, multiplier: 1, constant: 10)
        
        let view2Trailing = NSLayoutConstraint.init(item: view2, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1, constant: 0)
        
        let equalWidth = NSLayoutConstraint.init(item: view1, attribute: .width, relatedBy: .equal, toItem: view2, attribute: .width, multiplier: 1, constant: 0)
        
        let topview1 = NSLayoutConstraint.init(item: view1, attribute: .top, relatedBy: .equal, toItem: self.view  , attribute: .top, multiplier: 1, constant: 0)
        
        let topview2 = NSLayoutConstraint.init(item: view2, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 0)
        
        let bottomview1 = NSLayoutConstraint.init(item: view1, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1, constant:0)
        
        let bottomview2 = NSLayoutConstraint.init(item: view2, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1, constant: 0)
        NSLayoutConstraint.activate([view1Leading,view2Leading,view2Trailing,equalWidth,topview1,topview2,bottomview1,bottomview2])
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
