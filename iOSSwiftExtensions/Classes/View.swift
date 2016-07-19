//
//  View.swift
//  Moiwlet
//
//  Created by Jaime Moises Gutierrez on 5/3/16.
//  Copyright © 2016 MoiGtz. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
	
	
	// MARK: Border
	
	/**
	The layer border color
	*/
	@IBInspectable var borderColor: UIColor {
		get {
			return layer.borderColor == nil ? UIColor.clearColor() : UIColor(CGColor: layer.borderColor!)
		}
		set {
			layer.borderColor = newValue.CGColor
		}
	}
	
	/**
	The layer border width
	*/
	@IBInspectable var borderWidth: CGFloat {
		get {
			return layer.borderWidth
		}
		set {
			layer.borderWidth = newValue
		}
	}
	
	
	// MARK: Corner Radius
	
	/**
	The layer corner radius
	*/
	@IBInspectable var cornerRadius: CGFloat {
		get {
			return layer.cornerRadius
		}
		set {
			layer.cornerRadius = newValue
			layer.masksToBounds = newValue > 0
		}
	}
	
	
	// MARK: Shadow
	
	/**
	The shadow color of the layer
	*/
	@IBInspectable var shadowColor: UIColor {
		get {
			return layer.shadowColor == nil ? UIColor.clearColor() : UIColor(CGColor: layer.shadowColor!)
		}
		set {
			layer.shadowColor = newValue.CGColor
		}
	}
	
	
	/**
	The shadow offset of the layer
	*/
	@IBInspectable var shadowOffset:CGSize {
		get {
			return layer.shadowOffset
		}
		set {
			layer.shadowOffset = newValue
		}
	}
	
	/**
	The shadow opacity of the layer
	
	- Returns: Float
	*/
	@IBInspectable var shadowOpacity:Float {
		get {
			return layer.shadowOpacity
		}
		set {
			layer.shadowOpacity = newValue
		}
	}
	
	/**
	The shadow radius of the layer
	
	- Returns: CGFloat
	*/
	@IBInspectable var shadowRadius:CGFloat {
		get {
			return layer.shadowRadius
		}
		set {
			layer.shadowRadius = newValue
		}
	}
	
	/**
	Assumes that you want the view to be rounded and that means that the roudning will be based upon the smaller value between the width and the height of the frame.
	
	*/
	func makeRounded() {
		
		self.cornerRadius = self.frame.height <= self.frame.width ? self.frame.height / 2.0 : self.frame.width / 2.0
	}
	
	// MARK: dismiss Kyeboard
	func addBackgroundTapKeyboardDismiss(){
		let tapGesture = UITapGestureRecognizer(target: self, action: #selector(UIView.hideKeyboard))
		tapGesture.cancelsTouchesInView = true
		self.addGestureRecognizer(tapGesture)
	}
	
	func hideKeyboard() {
		self.endEditing(true)
	}
	
	func addShadow(){
		self.layer.masksToBounds = false
		self.layer.shadowOffset = CGSizeMake(0, 5)
		self.layer.shadowRadius = 5
		self.layer.shadowOpacity = 0.2
	}
	
	//MARK: Animations
	
	func shakeHorizontally(duration: Double = 0.5) {
		let animation: CAKeyframeAnimation = CAKeyframeAnimation(keyPath: "transform.translation.x")
		animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
		animation.duration = duration
		animation.values = [-12, 12, -8, 8, -4, 4, 0]
		self.layer.addAnimation(animation, forKey: "shake")
	}
	
	func shakeVertically(duration: Double = 0.5) {
		let animation: CAKeyframeAnimation = CAKeyframeAnimation(keyPath: "transform.translation.y")
		animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
		animation.duration = duration
		animation.values = [-12, 12, -8, 8, -4, 4, 0]
		self.layer.addAnimation(animation, forKey: "shake")
	}
	
	func floatVertically(duration: Double = 10.0) {
		
		let animation: CAKeyframeAnimation = CAKeyframeAnimation(keyPath: "transform.translation.y")
		animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
		animation.duration = duration
		animation.keyTimes = [0.0, 5.0, 10.0]
		animation.values = [-4, 4, 0]
		self.layer.addAnimation(animation, forKey: "floatVertically")
		
	}
	
	func levitate(){
		
		NSTimer.scheduledTimerWithTimeInterval(10.0, target: self, selector: #selector(UIView.floatVertically(_:)), userInfo: nil, repeats: true)
		
	}
	
	func applyMotionEffects() {
		// Motion effects are available starting from iOS 7.
		let horizontalEffect: UIInterpolatingMotionEffect = UIInterpolatingMotionEffect(keyPath: "center.x", type: .TiltAlongHorizontalAxis)
		horizontalEffect.minimumRelativeValue = -10.0
		horizontalEffect.maximumRelativeValue = 10.0
		let verticalEffect: UIInterpolatingMotionEffect = UIInterpolatingMotionEffect(keyPath: "center.y", type: .TiltAlongVerticalAxis)
		verticalEffect.minimumRelativeValue = -10.0
		verticalEffect.maximumRelativeValue = 10.0
		let motionEffectGroup: UIMotionEffectGroup = UIMotionEffectGroup()
		motionEffectGroup.motionEffects = [horizontalEffect, verticalEffect]
		self.addMotionEffect(motionEffectGroup)
	}
	
	func pulseToSize(scale: CGFloat, duration: NSTimeInterval, shouldRepeat: Bool) {
		let pulseAnimation: CABasicAnimation = CABasicAnimation(keyPath: "transform.scale")
		pulseAnimation.duration = duration
		pulseAnimation.fromValue = 1.0
		pulseAnimation.toValue = scale
		pulseAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
		pulseAnimation.autoreverses = true
		pulseAnimation.repeatCount = shouldRepeat ? Float.infinity : 0
		self.layer.addAnimation(pulseAnimation, forKey: "pulse")
	}
	
	public enum UIViewAnimationFlipDirection: Int {
		
		case FromTop = 0
		case FromLeft
		case FromRight
		case FromBottom
		
	}
	
	func flipWithDuration(duration: NSTimeInterval, direction: UIViewAnimationFlipDirection, repeatCount: Float, autoreverse shouldAutoreverse: Bool) {
		var subtype: String? = nil
		switch direction {
		case .FromTop:
			subtype = "fromTop"
		case .FromLeft:
			subtype = "fromLeft"
		case .FromBottom:
			subtype = "fromBottom"
		default:
			subtype = "fromRight"
		}
		
		let transition: CATransition = CATransition()
		transition.startProgress = 0
		transition.endProgress = 1.0
		transition.type = "flip"
		transition.subtype = subtype!
		transition.duration = duration
		transition.repeatCount = repeatCount
		transition.autoreverses = shouldAutoreverse
		self.layer.addAnimation(transition, forKey: "spin")
	}
	
	public enum UIViewAnimationRotationDirection: Int {
		
		case Right = 0
		case Left
		
	}
	
	func rotateToAngle(angle: CGFloat, duration: NSTimeInterval, direction: UIViewAnimationRotationDirection, repeatCount: Float, autoreverse shouldAutoreverse: Bool) {
		let rotationAnimation: CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
		rotationAnimation.fromValue = 0
		rotationAnimation.toValue = direction == .Right ? angle : -angle
		rotationAnimation.duration = duration
		rotationAnimation.autoreverses = shouldAutoreverse
		rotationAnimation.repeatCount = repeatCount
		rotationAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
		self.layer.addAnimation(rotationAnimation, forKey: "transform.rotation.z")
	}
	
	func stopAnimation() {
		CATransaction.begin()
		self.layer.removeAllAnimations()
		CATransaction.commit()
		CATransaction.flush()
	}
	
	func isBeingAnimated() -> Bool {
		return self.layer.animationKeys()!.count > 0 ? true : false
	}
	
	func pulseViewWithRandomDuration() {
		let timeInterval: Double = (Double(arc4random()) / 0x100000000) * (0.4 - 0.2) + 0.2
		self.pulseToSize(1.1, duration: timeInterval, shouldRepeat: false)
	}
	
	func pulse() {
		self.pulseToSize(1.1, duration: 0.3, shouldRepeat: false)
	}
	
	func pulseSlow() {
		
		self.pulseToSize(1.3, duration: 3.0, shouldRepeat: true)
		
	}
	
	func pulseFast() {
		
		self.pulseToSize(1.1, duration: 0.1, shouldRepeat: false)
		
	}
	
	func pulseFastTwice() {
		pulseFast()
		self.performSelector(#selector(UIView.pulseFast), withObject: self, afterDelay: 0.3)
	}
	
	func pulseSlowAndSmall() {
		
		self.pulseToSize(0.97, duration: 4.0, shouldRepeat: true)
		
	}
	
	func heartBeatPulse() {
		
		let timeInterval: Double = (Double(arc4random()) / 0x100000000) * (2.0 - 1.0) + 1.0
		NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: #selector(UIView.pulseFastTwice), userInfo: nil, repeats: true)
		
	}
	
	func oxigenPulse() {
		
		let timeInterval: Double = (Double(arc4random()) / 0x100000000) * (6.0 - 5.0) + 5.0
		NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: #selector(UIView.pulseSlow), userInfo: nil, repeats: true)
		
	}
	
	func orbPulse() {
		
		let timeInterval: Double = (Double(arc4random()) / 0x100000000) * (8.0 - 7.0) + 7.0
		NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: #selector(UIView.pulseSlowAndSmall), userInfo: nil, repeats: true)
		
	}
	
	//Mark: Overrides
	
}
