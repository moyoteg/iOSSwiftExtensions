//
//  ViewController.swift
//  Moiwlet
//
//  Created by Jaime Moises Gutierrez on 5/2/16.
//  Copyright © 2016 MoiGtz. All rights reserved.
//

import UIKit

extension UIViewController {
	
	func presentStoryBoard(storyboardName: String) {
		
		let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
		if let vc = storyboard.instantiateInitialViewController(){
			self.presentViewController(vc, animated: true) { () -> Void in
				
				
			}
		}
		
	}
	
}
