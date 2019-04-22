//
//  ModalViewController.swift
//  TestTransitions
//
//  Created by Eugene Braginets on 22/04/2019.
//  Copyright © 2019 Eugene Braginets. All rights reserved.
//

import Foundation
import UIKit

class ModalViewController: UIViewController, InteractiveDismissing {

	override func viewDidLoad() {
		super.viewDidLoad()

		view.backgroundColor = UIColor.lightGray

		let btn = UIButton(frame: CGRect(origin: CGPoint.zero, size: CGSize.init(width: 60, height: 50)))
		btn.addTarget(self, action: #selector(ModalViewController.closeModalView), for: .touchDown)
		btn.setTitle("CLOSE", for: .normal)

		view.addSubview(btn)
		btn.center = view.center


		let panGesture = UIPanGestureRecognizer(target: self, action: #selector(ModalViewController.didTrackPanGesture))
		view.addGestureRecognizer(panGesture
		)

		// Do any additional setup after loading the view.
	}


	@objc func closeModalView() {
		dismiss(animated: true, completion: nil)
	}

	var animator: UIViewPropertyAnimator?

	@objc func didTrackPanGesture(sender: UIPanGestureRecognizer) {

		dismissInteractively(with: sender) {
			self.dismiss(animated: false, completion: nil)
		}

	}

}

