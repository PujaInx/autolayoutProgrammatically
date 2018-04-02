//
//  DynamicHeightLabelAndTextField.swift
//  demoAutoLayoutProgrammatically
//
//  Created by Intelivex Labs on 27/03/18.
//  Copyright © 2018 Intelivex Labs. All rights reserved.
//

import UIKit

class DynamicHeightLabelAndTextField: UIViewController {

    let lblName = UILabel()
    let txtEnterName = UITextField()
    
    var usingLargeFont = false
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        super.loadView()
        self.uiSetUp()
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(changeFontSizeTimerDidFire(timer:)), userInfo: nil, repeats: true)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        timer?.invalidate()
        timer = nil
    }
    
    @objc func changeFontSizeTimerDidFire(timer: Timer) {
        
        usingLargeFont = !usingLargeFont
        self.lblName.font = usingLargeFont ? UIFont.systemFont(ofSize: 36.0) : UIFont.systemFont(ofSize: 17.0)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func uiSetUp() {
        self.view.addSubview(self.lblName)
        self.lblName.translatesAutoresizingMaskIntoConstraints = false
        self.lblName.font = UIFont.boldSystemFont(ofSize: 20)
        self.lblName.text = "Name"
        
        self.view.addSubview(self.txtEnterName)
        self.txtEnterName.translatesAutoresizingMaskIntoConstraints = false
        self.txtEnterName.borderStyle = .roundedRect
        
        self.lblName.leadingAnchor.constraint(equalTo:self.view.leadingAnchor, constant: 4).isActive = true
        self.txtEnterName.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -4).isActive = true
        
        
        self.lblName.topAnchor.constraint(greaterThanOrEqualTo: self.view.topAnchor, constant: 20).isActive = true
        self.txtEnterName.topAnchor.constraint(greaterThanOrEqualTo: self.view.topAnchor, constant: 20).isActive = true
        
        let lblTop = self.lblName.topAnchor.constraint(equalTo:self.view.topAnchor, constant: 20)
        let txtTop = self.txtEnterName.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 20)
        
        lblTop.priority = .defaultLow
        txtTop.priority = .defaultLow
        
        NSLayoutConstraint.activate([lblTop,txtTop])
        
        self.txtEnterName.leadingAnchor.constraint(equalTo: self.lblName.trailingAnchor, constant: 4).isActive = true
        self.lblName.lastBaselineAnchor.constraint(equalTo: self.txtEnterName.lastBaselineAnchor, constant: 0).isActive = true
    }
    
}
