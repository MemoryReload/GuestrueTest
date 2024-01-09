//
//  GestureManager.swift
//  GuestrueTest
//
//  Created by HePing on 2023/11/18.
//
import UIKit

class GestureManager {
    let gestureRecognizer = UILongPressGestureRecognizer()
    
    init() {
        self.gestureRecognizer.minimumPressDuration = 0.3
    }
    
    // add gesture
    func addGestureRecognizer(to view: UIView, target: Any, action: Selector) {
        view.addGestureRecognizer(gestureRecognizer)
        gestureRecognizer.addTarget(target, action: action)
    }
    
    // remove gesture
    func removeGestureRecognizer(from view: UIView) {
        view.removeGestureRecognizer(gestureRecognizer)
    }
    
    // remove target-action
    func removeGestureRecognizer(target: Any, action: Selector) {
        gestureRecognizer.removeTarget(target, action: action)
    }
}
