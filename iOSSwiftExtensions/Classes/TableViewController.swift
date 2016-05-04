//
//  TableViewController.swift
//  Moiwlet
//
//  Created by Jaime Moises Gutierrez on 5/1/16.
//  Copyright © 2016 MoiGtz. All rights reserved.
//

import UIKit

extension UITableViewController {
	
	
	func setBackgroundImage(imageName: String) {
	
		let imageView = UIImageView(frame: self.tableView.frame)
		imageView.image = UIImage(named: imageName)
		self.tableView.backgroundView = imageView
		
	}
	
	
	
}
