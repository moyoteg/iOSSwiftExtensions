//
//  NavigationController.swift
//  Moiwlet
//
//  Created by Jaime Moises Gutierrez on 5/1/16.
//  Copyright © 2016 MoiGtz. All rights reserved.
//

import UIKit

extension UINavigationController {
	
	func makeBackgroundTransparent() {
		
		self.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
		self.navigationBar.shadowImage = UIImage()
		self.navigationBar.translucent = true

	}
	
}
