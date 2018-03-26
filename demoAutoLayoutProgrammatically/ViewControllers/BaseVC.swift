//
//  BaseVC.swift
//  SnapKitAutoLayOutDemo
//
//  Created by Intelivex Labs on 21/03/18.
//  Copyright © 2018 Intelivex Labs. All rights reserved.
//

import UIKit
class BaseVC: UIViewController {
    
    let recipes = Recipe.loadRecipes()
    let titleLabel = UILabel()
    let containerView = UIView()
    var navigationButtons = [UIButton]()
    var currentRecipeIndex = 0
    let colorDictionary = [
        "Next":UIColor(red: 0.0, green: 0.0, blue: 1.0, alpha: 1.0),
        "Info": .green,
        "Previous": .red,
        ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
    }
    
    override func loadView() {
        super.loadView()
        self.containerView.translatesAutoresizingMaskIntoConstraints = false
        self.containerView.layer.borderWidth = 1.0
        self.containerView.layer.borderColor = UIColor.black.cgColor
        self.containerView.layoutMargins = UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0)
        let vc = UIViewController()
        self.addAsChildVC(childVC: vc)
        self.uiSetUp()
        showRecipe(recipe: recipes[currentRecipeIndex])
    }
    
    
    private func enableButtons(enabled: Bool = true) {
        for button in navigationButtons {
            button.isEnabled = enabled
        }
    }
    
    private func showRecipe(recipe: Recipe) {
        titleLabel.text = recipe.title
        enableButtons(enabled: false)
        
        let newViewController = recipe.instantiateViewController()
        let oldViewController = childViewControllers[0]
        
        let newView = newViewController.view
        let containerMargins = self.containerView.layoutMarginsGuide
        
        newView?.translatesAutoresizingMaskIntoConstraints = false
        addChildViewController(newViewController)
        
        
        transition(from: oldViewController, to: newViewController, duration: 0.25, options: [.transitionCrossDissolve], animations: {
            
            newView?.layoutMarginsGuide.topAnchor.constraint(equalTo: containerMargins.topAnchor, constant: 0).isActive = true
            newView?.layoutMarginsGuide.bottomAnchor.constraint(equalTo: containerMargins.bottomAnchor, constant: 0).isActive = true
            newView?.layoutMarginsGuide.leadingAnchor.constraint(equalTo: containerMargins.leadingAnchor, constant: 0).isActive = true
            newView?.layoutMarginsGuide.trailingAnchor.constraint(equalTo: containerMargins.trailingAnchor, constant: 0).isActive = true    
            
        }, completion: { [unowned self] _ in
            oldViewController.removeFromParentViewController()
            self.enableButtons()
        })
    }
    @objc func showNextRecipe(sender: AnyObject) {
        let count = recipes.count
        let index = (currentRecipeIndex + 1) % count
        let recipe = recipes[index]
        
        showRecipe(recipe: recipe)
        currentRecipeIndex = index
    }
    
    func colorButton(withColor color:UIColor, title:String) -> UIButton? {
        var newButton : UIButton?
        if title != "Info" {
            newButton = UIButton(type: .system)
            newButton?.setTitle(title, for: .normal)
            newButton?.setTitleColor(color, for: .normal)
            if title == "Next" {
                newButton?.addTarget(self, action: #selector(showNextRecipe(sender:)), for: .touchUpInside)
            }
        }
        else {
            newButton = UIButton(type: .infoDark)
        }
        if let btn = newButton {
            return btn
        }
        return nil
    }
    
    func uiSetUp() {
        
        func addConstraint(To stackView:() -> UIStackView)  {
            let stack = stackView()
            
            stack.layoutMarginsGuide.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive  = true
            stack.layoutMarginsGuide.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive  = true
            stack.layoutMarginsGuide.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive  = true
            stack.layoutMarginsGuide.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive  = true
            self.titleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
            
        }
        
        func setUpSubViewsOfStackView() -> UIStackView {
            for (myKey,myValue) in self.colorDictionary {
                if let btn = colorButton(withColor: myValue, title: myKey) {
                    navigationButtons += [btn]
                }
            }
            
            let subStackView = UIStackView(arrangedSubviews: navigationButtons)
            subStackView.translatesAutoresizingMaskIntoConstraints = false
            subStackView.axis = .horizontal
            subStackView.distribution = .fillEqually
            subStackView.alignment = .fill
            subStackView.spacing = 10
            
            self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
            self.titleLabel.text = "Flowers"
            self.titleLabel.textColor = .black
            self.titleLabel.textAlignment = .center
            
            let stackView = UIStackView(arrangedSubviews: [self.titleLabel,self.containerView,subStackView])
            stackView.axis = .vertical
            stackView.distribution = .fill
            stackView.alignment = .fill
            stackView.spacing = 10
            stackView.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(stackView)
            return stackView
        }
        
        addConstraint(To: setUpSubViewsOfStackView)
    }
    
    func addAsChildVC(childVC: UIViewController) {
        addChildViewController(childVC)
        self.containerView.addSubview(childVC.view)
        childVC.view.frame = self.view.frame
        childVC.didMove(toParentViewController: self)
    }
    
    
    
}
