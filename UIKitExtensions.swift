//
//  UIKitExtensions.swift
//  Westeros
//
//  Created by Fabio Gomez on 11/7/17.
//  Copyright © 2017 Fabio Gomez. All rights reserved.
//

import UIKit

// Método para envolver un UINavigationController en un UINavigationController

extension UIViewController{
    
    func wrappedInNavigation() -> UINavigationController{
        let nav = UINavigationController (rootViewController: self) // Creamos un nav controller
        return nav
    }
}
