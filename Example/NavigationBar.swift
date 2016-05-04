//
//  NavigationBar.swift
//  Moiwlet
//
//  Created by Jaime Moises Gutierrez on 5/1/16.
//  Copyright © 2016 MoiGtz. All rights reserved.
//

import UIKit

enum NavigationBarStyle {
	case Home
}

extension UINavigationBar {
	
	func makeNavigationBar(style: NavigationBarStyle) {
		
		switch style {
		case .Home:
			
			print("yay")
			
		}
	}
	
}
