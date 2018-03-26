/*
    Copyright (C) 2015 Apple Inc. All Rights Reserved.
    See LICENSE.txt for this sample’s licensing information

    Abstract:
    A struct that defines details for each recipe.
*/

import UIKit

extension Recipe {
    
    var segueIdentifier: String {
        return identifier.rawValue
    }
    
    func instantiateViewController() -> UIViewController {
        var vc = UIViewController()
        switch identifier.rawValue {
        case CookbookStoryboardIdentifier.SimpleStackView.rawValue:
            vc = SimpleStackView()
            break
        case CookbookStoryboardIdentifier.NestedStackViews.rawValue:
            vc = NestedStackViews()
            break
        case CookbookStoryboardIdentifier.DynamicStackView.rawValue:
            vc = DynamicStackView()
            break
        case CookbookStoryboardIdentifier.TwoEqualWidthViews.rawValue:
            vc = TwoEqualWidthViews()
            break
        default: break
            
        }
        return vc
    }
}

struct Recipe {
    // MARK: Properties
    
    let title: String
    
    let identifier: CookbookStoryboardIdentifier
    
    let description: String
}
