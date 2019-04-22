//
//  InteractiveDismissing.swift
//  TestTransitions
//
//  Created by Eugene Braginets on 22/04/2019.
//  Copyright © 2019 Eugene Braginets. All rights reserved.
//

import Foundation
import UIKit

protocol InteractiveDismissing: NSObject {

	var animator: UIViewPropertyAnimator? { get set }

}

extension InteractiveDismissing {

	func dismissInteractively(with sender: UIPanGestureRecognizer, onCompletion completion: (() -> ())?) {

		guard let view = sender.view else { return }


		let translation = sender.translation(in: view)
		let progress = translation.y / view.bounds.height

		switch sender.state {

		case .began:

			self.animator = UIViewPropertyAnimator(duration: 0.3, curve: .easeOut, animations: {
				view.transform = CGAffineTransform.identity.translatedBy(x: 0, y: view.bounds.height)
			})

			animator?.startAnimation()
			animator?.pauseAnimation()
			animator?.addCompletion { position in

				switch position {
				case .start:
					view.transform = CGAffineTransform.identity
				case .end:
					completion?()
				default:
					()
				}

			}

		case .changed:
			animator?.fractionComplete = progress

		case .ended:

			guard let animatorProgress = animator?.fractionComplete else { return }

			if animatorProgress < 0.3 {

				animator?.isReversed = true
				animator?.continueAnimation(withTimingParameters: nil, durationFactor: 0.3)

			} else {
				animator?.continueAnimation(withTimingParameters: nil, durationFactor: 0.3)
			}

		case .cancelled, .failed:
			animator?.isReversed = true
			animator?.continueAnimation(withTimingParameters: nil, durationFactor: 0.3)

		default:
			()
		}
	}
}
