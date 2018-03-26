//
//  NestedStackViews.swift
//  demoAutoLayoutProgrammatically
//
//  Created by Intelivex Labs on 16/03/18.
//  Copyright © 2018 Intelivex Labs. All rights reserved.
//

import UIKit

extension UIStackView {
    func changeBGColor(To color:UIColor) {
        let makeLayer = CAShapeLayer()
        self.layer.insertSublayer(makeLayer, at: 0)
        makeLayer.path = UIBezierPath(rect: self.bounds).cgPath
        makeLayer.fillColor = color.cgColor
    }
}

class NestedStackViews: UIViewController {
    var baseStackView = UIStackView()
    var userDetailStackView = UIStackView()
    
    var btnActionStackView = UIStackView()
    var imgView = UIImageView()
    override func viewDidLoad() {
        super.viewDidLoad()
        //        self.setUpUI()
        
        // Do any additional setup after loading the view.
    }
    
    //    override func viewDidLayoutSubviews() {
    //        super.viewDidLayoutSubviews()
    //         self.setUpUI()
    //    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.setUpUI()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func setUpUI() {
        
        func setUserdDetailStackView() {
            baseStackView.addArrangedSubview(userDetailStackView)
            userDetailStackView.translatesAutoresizingMaskIntoConstraints = false
//            userDetailStackView.heightAnchor.constraint(equalToConstant: 105).isActive = true
            
            
            userDetailStackView.axis = .horizontal
            userDetailStackView.alignment = .fill
            userDetailStackView.distribution = .fill
            userDetailStackView.spacing = 8
            
            imgView.translatesAutoresizingMaskIntoConstraints = false
            imgView.image = #imageLiteral(resourceName: "square_flowers")
            imgView.widthAnchor.constraint(equalTo:imgView.heightAnchor , multiplier: 1.0).isActive = true
            userDetailStackView.addArrangedSubview(imgView)
            
            let userNameStackView = UIStackView()
            userNameStackView.translatesAutoresizingMaskIntoConstraints = false
            userNameStackView.axis = .vertical
            userNameStackView.alignment = .leading
            userNameStackView.distribution = .fillEqually
            userNameStackView.spacing = 8
            userDetailStackView.addArrangedSubview(userNameStackView)
            
            let lblName = UILabel()
            lblName.translatesAutoresizingMaskIntoConstraints = false
            lblName.text = "First"
            userNameStackView.addArrangedSubview(lblName)
            
            let lblMiddle = UILabel()
            lblMiddle.translatesAutoresizingMaskIntoConstraints = false
            lblMiddle.text = "Middle"
            userNameStackView.addArrangedSubview(lblMiddle)
            
            let lblLast = UILabel()
            lblLast.translatesAutoresizingMaskIntoConstraints = false
            lblLast.text = "Last"
            userNameStackView.addArrangedSubview(lblLast)
            userNameStackView.widthAnchor.constraint(equalToConstant: 60).isActive = true
            
            
            let userTextFieldStackView = UIStackView()
            userTextFieldStackView.translatesAutoresizingMaskIntoConstraints = false
            userTextFieldStackView.axis = .vertical
            userTextFieldStackView.alignment = .fill
            userTextFieldStackView.distribution = .fillEqually
            userTextFieldStackView.spacing = 2
            userDetailStackView.addArrangedSubview(userTextFieldStackView)
            
            let txtName = UITextField()
            txtName.translatesAutoresizingMaskIntoConstraints = false
            txtName.placeholder = "First"
            txtName.borderStyle = .roundedRect
            userTextFieldStackView.addArrangedSubview(txtName)
            
            let txtMiddle = UITextField()
            txtMiddle.translatesAutoresizingMaskIntoConstraints = false
            txtMiddle.placeholder = "Middle"
            txtMiddle.borderStyle = .roundedRect
            userTextFieldStackView.addArrangedSubview(txtMiddle)
            
            let txtLast = UITextField()
            txtLast.translatesAutoresizingMaskIntoConstraints = false
            txtLast.placeholder = "Last"
            txtLast.borderStyle = .roundedRect
            userTextFieldStackView.addArrangedSubview(txtLast)
            
            userDetailStackView.heightAnchor.constraint(equalToConstant: 105).isActive = true
        }
        
        func setTextView() {
            let txtViewDescription = UITextView()
            txtViewDescription.translatesAutoresizingMaskIntoConstraints = false
            txtViewDescription.text = ""
            txtViewDescription.textColor = .white
            txtViewDescription.backgroundColor = .gray
            txtViewDescription.isScrollEnabled = false
            baseStackView.addArrangedSubview(txtViewDescription)
        }
        
        func setEditCancelClearButton() {
            baseStackView.addArrangedSubview(btnActionStackView)
            btnActionStackView.translatesAutoresizingMaskIntoConstraints = false
            let btnEdit = UIButton()
            btnEdit.translatesAutoresizingMaskIntoConstraints = false
            btnEdit.setTitle("Edit", for: .normal)
            btnEdit.setTitleColor(.black, for: .normal)
            btnActionStackView.addArrangedSubview(btnEdit)
            btnActionStackView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        }
        
        
        self.view.addSubview(baseStackView)
        baseStackView.translatesAutoresizingMaskIntoConstraints = false;
        
        baseStackView.layoutMarginsGuide.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor).isActive  = true
        baseStackView.layoutMarginsGuide.bottomAnchor.constraint(equalTo: self.view.layoutMarginsGuide.bottomAnchor).isActive  = true
        baseStackView.layoutMarginsGuide.leadingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.leadingAnchor).isActive  = true
        baseStackView.layoutMarginsGuide.trailingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.trailingAnchor).isActive  = true
        
        
//        baseStackView.snp.makeConstraints { (make) -> Void in
//            make.topMargin.equalTo(self.view).offset(0)
//            make.leadingMargin.equalTo(self.view).offset(0)
//            make.bottomMargin.equalTo(self.view).offset(0)
//            make.trailingMargin.equalTo(self.view).offset(0)
//        }
        //        baseStackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        //        baseStackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        //        baseStackView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        //        baseStackView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        
        baseStackView.axis = .vertical
        baseStackView.alignment = .fill
        baseStackView.distribution = .fill
        baseStackView.spacing = 8
        //        baseStackView.changeBGColor(To: .lightText)
        
        setUserdDetailStackView()
        setTextView()
        setEditCancelClearButton()
        self.view.layoutIfNeeded()
        
    }
}

