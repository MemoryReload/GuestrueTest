//
//  ModalViewController.swift
//  GuestrueTest
//
//  Created by HePing on 2023/11/18.
//

import UIKit

class ModalViewController: UIViewController {
    var gestureManager: GestureManager?
    let area = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        // restore the guestrue on modal controller
        area.backgroundColor = .red
        view.addSubview(area)
        area.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-20)
            make.height.equalTo(120)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        if let gestureManager = gestureManager {
            gestureManager.addGestureRecognizer(to: area, target: self, action: #selector(handleLongPress(_:)))
            print("restore long press with state: \(gestureManager.gestureRecognizer.state)")
        }
    }
    
    @objc func handleLongPress(_ gestureRecognizer: UILongPressGestureRecognizer) {
        // 处理长按手势在新的 view controller 中的逻辑
        print("continue long press with state: \(gestureRecognizer.state)")
        switch gestureRecognizer.state {
        case .ended:
            fallthrough
        case .cancelled:
            if let gestureManager = self.gestureManager {
                gestureManager.removeGestureRecognizer(target: self, action: #selector(handleLongPress(_:)))
            }
            self.dismiss(animated: true)
        default:
            break
        }
    }
}
