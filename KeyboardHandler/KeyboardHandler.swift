//
//  KeyboardHandler.swift
//  KeyboardHandler
//
//  Created by Chun-Li Cheng on 2023/8/24.
//

import Foundation
import UIKit

class KeyboardHandler: NSObject, UITextFieldDelegate {
    weak var activeTextField: UITextField?
    weak var viewController: UIViewController?
    let keyboardOffset: Box<CGFloat> = Box(0)
    let offsetY: CGFloat = 20
    
    init(for viewController: UIViewController) {
        self.viewController = viewController
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        activeTextField = textField
        
        guard let activeTextField = activeTextField else { return }
        
        // 此刻 TextField 的底部 Y
        let textFieldFrame = activeTextField.convert(activeTextField.bounds,
                                                     to: self.viewController?.view)
        let textFieldY = textFieldFrame.maxY
        // 假設鍵盤高度
        let estimatedKeyboardHeight: CGFloat = 360

        // 此刻鍵盤頂部 Y
        let keyboardY = (self.viewController?.view.frame.height ?? 0) - estimatedKeyboardHeight
        // 若大於零需提高
        let targetY = textFieldY - keyboardY
        
        if targetY > 0 {
            keyboardOffset.value = -targetY - offsetY
        }
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
//            let customView = UIView(frame: CGRect(x: 0,
//                                                  y: 0,
//                                                  width: self.viewController?.view.bounds.width ?? 0,
//                                                  height: 0))
//            textField.inputAccessoryView = customView
//            if let accessoryView = textField.inputAccessoryView {
//                let estimatedKeyboardHeight = (self.viewController?.view.bounds.height ?? 0) - accessoryView.frame.minY
//                print("Estimated Keyboard Height: \(estimatedKeyboardHeight)")
//            }
//        }
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        keyboardOffset.value = 0
    }
    
    
    func animateKeyboardOffset(offset: CGFloat, in viewController: UIViewController?) {
        UIView.animate(withDuration: 0.25) {
            viewController?.view.frame = CGRect(
                x: 0,
                y: offset,
                width: viewController?.view.bounds.width ?? 0,
                height: viewController?.view.bounds.height ?? 0)
        }
    }

    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
    }
}
