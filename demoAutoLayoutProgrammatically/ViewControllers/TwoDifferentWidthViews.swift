//
//  TwoDifferentWidthViews.swift
//  demoAutoLayoutProgrammatically
//
//  Created by Intelivex Labs on 26/03/18.
//  Copyright © 2018 Intelivex Labs. All rights reserved.
//

import UIKit

class TwoDifferentWidthViews: UIViewController {
    
    let purpleView = UIView()
    let orangeView = UIView ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func loadView() {
        super.loadView()
        self.setupUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupUI() {
        self.view.addSubview(self.purpleView)
        self.purpleView.backgroundColor = .purple
        self.purpleView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(self.orangeView)
        self.orangeView.backgroundColor = .orange
        self.orangeView.translatesAutoresizingMaskIntoConstraints = false
        
        self.purpleView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.purpleView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 20).isActive = true
        self.purpleView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -20).isActive = true
        
        self.orangeView.leadingAnchor.constraint(equalTo: self.purpleView.trailingAnchor,constant: 8).isActive = true
        self.orangeView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.orangeView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 20).isActive = true
        self.orangeView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -20).isActive = true
        
        self.orangeView.widthAnchor.constraint(equalTo: self.purpleView.widthAnchor, multiplier: 2).isActive = true
        
     
    }
    

}
