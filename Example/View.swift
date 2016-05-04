//
//  View.swift
//  Moiwlet
//
//  Created by Jaime Moises Gutierrez on 5/3/16.
//  Copyright © 2016 MoiGtz. All rights reserved.
//

import UIKit

extension UIView {
	
	@IBInspectable var cornerRadius: CGFloat {
		get {
			return layer.cornerRadius
		}
		set {
			layer.cornerRadius = newValue
			layer.masksToBounds = newValue > 0
		}
	}
	
}
