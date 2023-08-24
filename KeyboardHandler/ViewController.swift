//
//  ViewController.swift
//  KeyboardHandler
//
//  Created by Chun-Li Cheng on 2023/8/24.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var secondTextField: UITextField!
    @IBOutlet weak var thirdTextField: UITextField!
    
//    var keyboardHandler: KeyboardHandler?
    
    private lazy var keyboardHandler = KeyboardHandler(for: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        hideKeyboardWhenTappedAround()
        setupTextField()

        keyboardHandler.keyboardOffset.bind({ [weak self] offset in
            self?.keyboardHandler.animateKeyboardOffset(offset: offset, in: self)
//            UIView.animate(withDuration: 0.25) {
//                self?.view.frame = CGRect(x: 0,
//                                          y: offset,
//                                          width: self?.view.bounds.width ?? 0,
//                                          height: self?.view.bounds.height ?? 0)
//            }
        })
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    private func setupTextField() {
//        keyboardHandler = KeyboardHandler(for: self)
        firstTextField.delegate = self.keyboardHandler
        secondTextField.delegate = self.keyboardHandler
        thirdTextField.delegate = self.keyboardHandler
//        firstTextField.delegate = self
    }
    
//    private func hideKeyboardWhenTappedAround() {
//        let tapAround: UITapGestureRecognizer =
//        UITapGestureRecognizer(target: self,
//                               action: #selector(dismissKeyboard))
//        tapAround.cancelsTouchesInView = false
//        view.addGestureRecognizer(tapAround)
//    }
//
//    @objc func dismissKeyboard() {
//        view.endEditing(true)
//    }
}

//extension ViewController: UITextFieldDelegate {
//
//}

