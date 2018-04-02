//
//  SimpleStackView.swift
//  demoAutoLayoutProgrammatically
//
//  Created by Intelivex Labs on 14/03/18.
//  Copyright © 2018 Intelivex Labs. All rights reserved.
//

import UIKit

class SimpleStackView: UIViewController {
  
    let titleLabel = UILabel()
    let imageView = UIImageView()
    let btnEdit = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        super.loadView()
        self.uiSetUp()
    }
    
    func uiSetUp() {
        func addConstraint(To stackView:() -> UIStackView)  {
            let stack = stackView()
            stack.translatesAutoresizingMaskIntoConstraints = false
            let top = stack.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0)
            let bottom = stack.bottomAnchor.constraint(equalTo:self.view.bottomAnchor, constant: 0)
            let left = stack.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0)
            let right = stack.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant:0)

            top.identifier = "cn9"
            bottom.identifier = "cn10"
            left.identifier = "cn11"
            right.identifier = "cn12"
            
            NSLayoutConstraint.activate([top,bottom ,right, left])
            self.view.layoutIfNeeded()
        }
        
        func setUpSubViewsOfStackView() -> UIStackView {
            
            self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
            self.titleLabel.text = "Flowers"
            self.titleLabel.textColor = .black
            self.titleLabel.textAlignment = .center
            self.titleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true

            self.imageView.image = #imageLiteral(resourceName: "flowers")
            self.imageView.contentMode = .scaleAspectFit
            self.imageView.translatesAutoresizingMaskIntoConstraints = false
            
            
            
            
            self.btnEdit.setTitle("Edit", for: .normal)
            self.btnEdit.setTitleColor(.black, for: .normal)
            self.btnEdit.translatesAutoresizingMaskIntoConstraints = false
            
            self.btnEdit.heightAnchor.constraint(equalToConstant: 30).isActive = true
            
            let stackView = UIStackView(arrangedSubviews: [self.titleLabel,self.imageView,self.btnEdit])
            stackView.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(stackView)
            stackView.axis = .vertical
            stackView.distribution = .fill
            stackView.alignment = .fill
            stackView.spacing = 8
            return stackView
        }
        addConstraint(To: setUpSubViewsOfStackView)
//        self.view.backgroundColor = .yellow
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
