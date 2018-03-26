//
//  NestedStackViews.swift
//  demoAutoLayoutProgrammatically
//
//  Created by Intelivex Labs on 16/03/18.
//  Copyright © 2018 Intelivex Labs. All rights reserved.
//

import UIKit

class NestedStackViews: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpUI()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func setUpUI()  {
        
        func setUserDetailSection() -> UIStackView {
            var userImage = UIImageView()
            userImage.image = #imageLiteral(resourceName: "square_flowers")
            userImage.contentMode = .scaleToFill
            userImage.translatesAutoresizingMaskIntoConstraints = false
        
//             userImage.addConstraint( NSLayoutConstraint.init(item: userImage, attribute: .height, relatedBy: .equal, toItem: userImage, attribute: .width, multiplier: 1.0, constant: 0))
            
            userImage.heightAnchor.constraint(equalTo: userImage.widthAnchor, multiplier: 1.0, constant: 0).isActive = true
            
//            func returnStackViewWithTextfield(for Name:String) -> (UIStackView,UITextField) {
//                let lblName = UILabel()
//                lblName.text = Name
//                let txtName = UITextField()
//                let stackView = UIStackView(arrangedSubviews: [lblName,txtName])
//                stackView.alignment = .firstBaseline
//                stackView.axis = .horizontal
//                stackView.distribution = .fill
//                stackView.contentMode = .scaleToFill
//                stackView.spacing = 8
//                return (stackView,txtName)
//            }
//
            
            func setUpUserNameDetail() -> UIStackView {
                
//                let txtFieldName = returnStackViewWithTextfield(for: "Name").1
//                let txtFieldMiddle = returnStackViewWithTextfield(for: "Middle").1
//                let txtFieldLast = returnStackViewWithTextfield(for: "Last").1
//
//                txtFieldName.translatesAutoresizingMaskIntoConstraints = false
//                txtFieldMiddle.translatesAutoresizingMaskIntoConstraints = false
//                txtFieldLast.translatesAutoresizingMaskIntoConstraints = false
//
                let vIew = UIView()
                view.backgroundColor = .yellow
                
                
                let stackView = UIStackView(arrangedSubviews: [userImage,vIew])
                stackView.axis = .vertical
                stackView.alignment = .fill
                stackView.distribution = .fill
                stackView.spacing = 8
                stackView.contentMode = .scaleAspectFill
                
//                txtFieldName.widthAnchor.constraint(equalTo: txtFieldMiddle.widthAnchor, multiplier: 1.0, constant: 0).isActive = true
//                txtFieldName.widthAnchor.constraint(equalTo: txtFieldLast.widthAnchor, multiplier: 1.0, constant: 0).isActive = true
//                
                return stackView
            }
            
            let userDetailstackView = UIStackView(arrangedSubviews: [userImage,setUpUserNameDetail()])
            userDetailstackView.axis = .horizontal
            userDetailstackView.alignment = .fill
            userDetailstackView.distribution = .fill
            userDetailstackView.spacing = 8
            userDetailstackView.contentMode = .scaleAspectFill
            return userDetailstackView
        }
        
        
        
        
        func setBaseStackView(viewToArrange:[UIView]) ->  UIStackView{
            let baseStackView = UIStackView(arrangedSubviews: viewToArrange)
            baseStackView.axis = .vertical
            baseStackView.alignment = .fill
            baseStackView.distribution = .fill
            baseStackView.spacing = 8
            baseStackView.contentMode = .scaleAspectFill
            self.view.addSubview(baseStackView)
            return baseStackView
        }
        
        func setAutoLayOutToView(baseView:UIStackView) {
            
            baseView.translatesAutoresizingMaskIntoConstraints = false
            
            let top = baseView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10)
            let bottom = baseView.bottomAnchor.constraint(equalTo:view.bottomAnchor, constant: -10)
            let left = baseView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0)
            let right = baseView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
            NSLayoutConstraint.activate([top,bottom ,right, left])
            baseView.layoutIfNeeded()
        }
        setAutoLayOutToView(baseView: setBaseStackView(viewToArrange:[setUserDetailSection()]))
    }

}
