#  Simple Interactive Transitions using iOS10's UIViewPropertyAnimator

1. Copy `InteractiveDismissing` class to your project
2. Conform ypour modal viewciontroller to the `InteractiveDismissing` protocol
```
var animator: UIViewPropertyAnimator?
```

3. Add `UIPanGestureRecognizer` to your view 

```
let panGesture = UIPanGestureRecognizer(target: self, action: #selector(ModalViewController.didTrackPanGesture))
view.addGestureRecognizer(panGesture)
```

3. In your gesture handler simply call:  
```
dismissInteractively(with: sender) {
	self.dismiss(animated: false, completion: nil)
}
```

4. __Done.__

