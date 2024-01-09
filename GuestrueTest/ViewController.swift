//
//  ViewController.swift
//  GuestrueTest
//
//  Created by HePing on 2023/11/18.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let gestureManager = GestureManager()
    let button = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
        button.backgroundColor = .red
        view.addSubview(button)
        button.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-40)
            make.height.equalTo(30)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        gestureManager.addGestureRecognizer(to: button, target: self, action: #selector(handleLongPress(_:)))
    }
    
    @objc func handleLongPress(_ gestureRecognizer: UILongPressGestureRecognizer) {
        // handling gesture
        print("begin long press with state: \(gestureRecognizer.state)")
        if gestureRecognizer.state == .began {
            gestureManager.removeGestureRecognizer(target: self, action: #selector(handleLongPress(_:)))
            show()
        }
    }
    
    func show() {
        // present modal view controller
        let viewController = ModalViewController()
        viewController.modalPresentationStyle = .fullScreen
        // set the gesture managerr
        viewController.gestureManager = gestureManager
        self.present(viewController, animated: true)
    }
}

