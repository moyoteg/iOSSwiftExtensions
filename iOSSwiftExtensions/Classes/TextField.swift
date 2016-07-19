//
//  TextField.swift
//  Moiwlet
//
//  Created by Jaime Moises Gutierrez on 5/9/16.
//  Copyright © 2016 MoiGtz. All rights reserved.
//

import UIKit

extension UITextField
{
	func setBottomBorder(color:UIColor)
	{
		self.borderStyle = UITextBorderStyle.None;
		let border = CALayer()
		let width = CGFloat(1.0)
		border.borderColor = color.CGColor
		border.frame = CGRect(x: 0, y: self.frame.size.height - width,   width:  self.frame.size.width, height: self.frame.size.height)
		
		border.borderWidth = width
		self.layer.addSublayer(border)
		self.layer.masksToBounds = false
	}
	
	
}