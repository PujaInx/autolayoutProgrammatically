//
//  SimpleLabelAndTextField.swift
//  demoAutoLayoutProgrammatically
//
//  Created by Intelivex Labs on 27/03/18.
//  Copyright © 2018 Intelivex Labs. All rights reserved.
//

import UIKit

class SimpleLabelAndTextField: UIViewController {

    let lblName = UILabel()
    let txtEnterName = UITextField()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        super.loadView()
        self.uiSetup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
 
    func uiSetup() {
        
        self.view.addSubview(self.lblName)
        self.lblName.translatesAutoresizingMaskIntoConstraints = false
        self.lblName.text = "Name"
        self.lblName.font = UIFont.boldSystemFont(ofSize: 20)
        
        self.view.addSubview(self.txtEnterName)
        self.txtEnterName.translatesAutoresizingMaskIntoConstraints = false
        self.txtEnterName.borderStyle = .roundedRect
        
        self.lblName.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 4).isActive = true
        self.lblName.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 20).isActive = true
        self.lblName.widthAnchor.constraint(equalToConstant: 45).isActive = true
        
        self.txtEnterName.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -4).isActive = true
        self.txtEnterName.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 20).isActive = true
       
        
//        self.lblName.bottomAnchor.constraint(equalTo: self.txtEnterName.bottomAnchor).isActive = true
        self.lblName.lastBaselineAnchor.constraint(equalTo: self.txtEnterName.lastBaselineAnchor, constant: 0).isActive = true
        self.lblName.trailingAnchor.constraint(equalTo: self.txtEnterName.leadingAnchor, constant: 4).isActive = true
        
    }

}
