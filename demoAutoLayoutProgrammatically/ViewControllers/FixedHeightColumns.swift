//
//  FixedHeightColumns.swift
//  demoAutoLayoutProgrammatically
//
//  Created by Intelivex Labs on 27/03/18.
//  Copyright © 2018 Intelivex Labs. All rights reserved.
//

import UIKit

class FixedHeightColumns: UIViewController {

    let lblFirstName = UILabel()
    let lblMiddleName = UILabel()
    let lblLastName = UILabel()
    
    let txtFirstName = UITextField()
    let txtMiddleName = UITextField()
    let txtLastName = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        super.loadView()
        self.uiSetUp()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func uiSetUp() {
        self.view.addSubview(self.lblFirstName)
        self.lblFirstName.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(self.txtFirstName)
        self.txtFirstName.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(self.lblMiddleName)
        self.txtMiddleName.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(self.txtMiddleName)
        self.txtMiddleName.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(self.lblLastName)
        self.lblLastName.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(self.txtLastName)
        self.txtLastName.translatesAutoresizingMaskIntoConstraints = false
        
        self.lblFirstName.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true                
        
        
        
    }

}
