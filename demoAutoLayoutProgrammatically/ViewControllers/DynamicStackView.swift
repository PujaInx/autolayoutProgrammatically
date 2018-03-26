//
//  DynamicStackView.swift
//  demoAutoLayoutProgrammatically
//
//  Created by Intelivex Labs on 17/03/18.
//  Copyright © 2018 Intelivex Labs. All rights reserved.
//

import UIKit

class DynamicStackView: UIViewController {
    var scrollView = UIScrollView()
    var baseStackView = UIStackView()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.setUpUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func setUpUI() {
        func setUpScrollView() {
            self.view.addSubview(self.scrollView)
            print("self.view frame \(self.view.frame)")
            print("safeareinsets \(view.safeAreaInsets)")
            self.scrollView.translatesAutoresizingMaskIntoConstraints = false
            self.scrollView.backgroundColor = .cyan
            self.scrollView.leadingAnchor.constraint(equalTo: (self.view.superview?.leadingAnchor)!, constant: 0).isActive = true
            self.scrollView.trailingAnchor.constraint(equalTo: (self.view.superview?.trailingAnchor)!, constant: 0).isActive = true
            self.scrollView.topAnchor.constraint(equalTo: (self.view.superview?.topAnchor)!, constant: 0).isActive = true
            self.scrollView.bottomAnchor.constraint(equalTo: (self.view.superview?.bottomAnchor)!, constant: 0).isActive = true
            self.scrollView.heightAnchor.constraint(equalTo: (self.view.superview?.heightAnchor)!, constant: 0).isActive = true
            self.scrollView.widthAnchor.constraint(equalTo: (self.view.superview?.widthAnchor)!, constant: 0).isActive = true
            self.view.addSubview(self.scrollView)
            
            self.scrollView.frame = view.bounds
            self.scrollView.contentSize = CGSize(width:self.view.bounds.width, height: self.view.bounds.height)

            
        }
        
        func setUpStackView() {
            self.scrollView.addSubview(baseStackView)
            self.baseStackView.translatesAutoresizingMaskIntoConstraints = false
            self.baseStackView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor, constant: 0).isActive = true
            self.baseStackView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor, constant: 0).isActive = true
            self.baseStackView.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: 0).isActive = true
//            self.baseStackView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor, constant: 0).isActive = true
            self.baseStackView.heightAnchor.constraint(equalTo: self.scrollView.heightAnchor).isActive = true
            self.baseStackView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor, constant: 0).isActive = true
            
            
            let btnAddItem = UIButton()
            btnAddItem.translatesAutoresizingMaskIntoConstraints = false
            btnAddItem.setTitle("Add Item", for: .normal)
            btnAddItem.setTitleColor(.black, for: .normal)
            btnAddItem.addTarget(self, action: #selector(addEntry(_:)), for: .touchUpInside)
            self.baseStackView.addArrangedSubview(btnAddItem)
            
            self.baseStackView.axis = .vertical
            self.baseStackView.alignment = .fill
            self.baseStackView.distribution = .equalSpacing
            self.baseStackView.spacing = 0
            
            
        }
        setUpScrollView()
        setUpStackView()
    }
    
    @objc func addEntry(_: AnyObject) {
        guard let addButtonContainerView = baseStackView.arrangedSubviews.last else { fatalError("Expected at least one arranged view in the stack view.") }
        let nextEntryIndex = baseStackView.arrangedSubviews.count - 1
        
        let offset = CGPoint(x: scrollView.contentOffset.x, y: scrollView.contentOffset.y + addButtonContainerView.frame.size.height)
        
        let newEntryView = createEntryView()
        newEntryView.isHidden = true
        
        baseStackView.insertArrangedSubview(newEntryView, at: nextEntryIndex)
        
        UIView.animate(withDuration: 0.25) {
            newEntryView.isHidden = false
            self.scrollView.contentOffset = offset
        }
    }
    
    @objc func deleteStackView(sender: UIButton) {
        guard let entryView = sender.superview else { return }
        
        UIView.animate(withDuration: 0.25, animations: {
            entryView.isHidden = true
        }, completion: { _ in
            entryView.removeFromSuperview()
        })
    }
    
    // MARK: Convenience
    
    /// Creates a horizontal stack view entry to add within the parent `stackView`.
    private func createEntryView() -> UIView {
        let date = DateFormatter.localizedString(from: NSDate() as Date, dateStyle: .short, timeStyle: .none)
        let number = NSUUID().uuidString
        
        let stack = UIStackView()
        //stack.changeBGColor(To: .red)
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fill
        stack.spacing = 8
        
        let dateLabel = UILabel()
        dateLabel.text = date
        dateLabel.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.body)
        
        let numberLabel = UILabel()
        numberLabel.text = number
        numberLabel.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.headline)
        numberLabel.setContentHuggingPriority(UILayoutPriority(rawValue: UILayoutPriority.RawValue(Double(UILayoutPriority.defaultLow.rawValue) - 1.0)), for: .horizontal)
        numberLabel.setContentCompressionResistancePriority(UILayoutPriority(rawValue: UILayoutPriority.RawValue(Double(UILayoutPriority.defaultHigh.rawValue) - 1.0)), for: .horizontal)
        
        //numberLabel.backgroundColor = .yellow
        
        let deleteButton = UIButton(type: .roundedRect)
        deleteButton.setTitle("Delete", for: .normal)
        deleteButton.addTarget(self, action: #selector(deleteStackView(sender:)), for: .touchUpInside)
        
        stack.addArrangedSubview(dateLabel)
        stack.addArrangedSubview(numberLabel)
        stack.addArrangedSubview(deleteButton)
        
        return stack
    }
    
    
}
