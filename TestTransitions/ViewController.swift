//
//  ViewController.swift
//  TestTransitions
//
//  Created by Eugene Braginets on 22/04/2019.
//  Copyright © 2019 Eugene Braginets. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let btn = UIButton(frame: CGRect(origin: CGPoint.zero, size: CGSize.init(width: 50, height: 50)))
		btn.addTarget(self, action: #selector(ViewController.openModalView), for: .touchDown)
		btn.setTitle("OPEN", for: .normal)
		btn.setTitleColor(UIColor.blue, for: .normal)
		view.addSubview(btn)
		btn.center = view.center
		// Do any additional setup after loading the view.
	}
	
	
	@objc func openModalView() {
		let vc = ModalViewController()
		vc.modalTransitionStyle = .coverVertical
		vc.modalPresentationStyle = .overCurrentContext
		present(vc, animated: true, completion: nil)
	}
	
}

