//
//  BaseViewController.swift
//  Appetito
//
//  Created by Diego Rodrigues on 25/09/22.
//

import UIKit
import FirebaseFirestore

class BaseViewController: UIViewController {
    
    //MARK: - Firestore
    let db = Firestore.firestore()
    
    //MARK: - LifeCycles
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        configureToDismissKeyboard()
    }
    
    
    //MARK: - DismissKeyboard
    var afterHideKeyboard: (() -> Void)?
    var afterShowKeyboard: ((_ heightKeyboard: CGFloat) -> Void)?
    
    func configureToDismissKeyboard() {
        
        let _: NSObjectProtocol = NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification,
                                                                         object: nil,
                                                                         queue: nil) {  notification in
            
            guard let value = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
            
            self.afterShowKeyboard?(value.cgRectValue.height)
        }
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.hideKeyboard))
        
        view.addGestureRecognizer(tap)
    }
    
    @objc func hideKeyboard() {
        
        view.endEditing(true)
        
        afterHideKeyboard?()
    }
}
