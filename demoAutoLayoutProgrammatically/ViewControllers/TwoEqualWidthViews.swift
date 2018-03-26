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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.setUpUI()
    }
    
    func setUpUI() {
        
        
        
        
        
        self.view.addSubview(view1)
        view1.translatesAutoresizingMaskIntoConstraints = false
        view1.backgroundColor = .red
//        view1.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 10).isActive = true
//        view1.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -20).isActive = true
//        view1.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        
        
        self.view.addSubview(view2)
        view2.translatesAutoresizingMaskIntoConstraints = false
        view2.backgroundColor = .green
//        view2.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 10).isActive = true
//        view2.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -20).isActive = true
//
//        view2.leadingAnchor.constraint(equalTo: view1.trailingAnchor, constant: 10).isActive = true
//        view2.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
//
//        view1.widthAnchor.constraint(equalTo: view2.widthAnchor
//        , constant: 0).isActive = true
        
        

     let view1Leading = NSLayoutConstraint.init(item: view1, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1, constant: 0)

    let view2Leading = NSLayoutConstraint.init(item: view2, attribute: .leading, relatedBy: .equal, toItem: view1, attribute: .trailing, multiplier: 1, constant: 10)

     let view2Trailing = NSLayoutConstraint.init(item: view2, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1, constant: 0)

     let equalWidth = NSLayoutConstraint.init(item: view1, attribute: .width, relatedBy: .equal, toItem: view2, attribute: .width, multiplier: 1, constant: 0)

    let topview1 = NSLayoutConstraint.init(item: view1, attribute: .top, relatedBy: .equal, toItem: self.view  , attribute: .top, multiplier: 1, constant: 0)

    let topview2 = NSLayoutConstraint.init(item: view2, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 0)

    let bottomview1 = NSLayoutConstraint.init(item: view1, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1, constant: 20)

    let bottomview2 = NSLayoutConstraint.init(item: view2, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1, constant: 20)
    NSLayoutConstraint.activate([view1Leading,view2Leading,view2Trailing,equalWidth,topview1,topview2,bottomview1,bottomview2])
        
        self.view.layoutIfNeeded()
        
        
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
//        self.view.addConstraint(NSLayoutConstraint.init(item: self.view1, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1.0, constant: 0))
//
//         self.view.addConstraint(NSLayoutConstraint.init(item: self.view1, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1.0, constant: 0))
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
