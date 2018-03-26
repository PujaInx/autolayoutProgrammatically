//
//  TwoViewsWithComplexWidths.swift
//  demoAutoLayoutProgrammatically
//
//  Created by Intelivex Labs on 26/03/18.
//  Copyright © 2018 Intelivex Labs. All rights reserved.
//

import UIKit

class TwoViewsWithComplexWidths: UIViewController {

    let grayView = UIView()
    let redView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func loadView() {
        super.loadView()
        self.setUpUI()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUpUI() {
        
        self.view.addSubview(self.grayView)
        self.grayView.backgroundColor = .gray
        self.grayView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(self.redView)
        self.redView.backgroundColor = .red
        self.redView.translatesAutoresizingMaskIntoConstraints = false
        
        self.grayView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.grayView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 20).isActive = true
        self.grayView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -20).isActive = true
        let width  =  self.grayView.widthAnchor.constraint(greaterThanOrEqualToConstant: 150)
        
        self.redView.leadingAnchor.constraint(equalTo: self.grayView.trailingAnchor,constant: 8).isActive = true
        self.redView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.redView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 20).isActive = true
        self.redView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -20).isActive = true
        
        let proportionalWidth = self.redView.widthAnchor.constraint(equalTo: self.grayView.widthAnchor, multiplier: 2)
        
        width.priority = .required
        proportionalWidth.priority = .defaultHigh
        
        NSLayoutConstraint.activate([width,proportionalWidth])
        
    }


}
