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
	
	
	func scrollToBottomAnimated(animated: Bool) {
		let numberOfRows: Int = tableView.numberOfRowsInSection(0)
		if numberOfRows != 0 {
			tableView.scrollToRowAtIndexPath(NSIndexPath(forRow: numberOfRows - 1, inSection: 0), atScrollPosition: .Bottom, animated: animated)
		}
	}
	
}
