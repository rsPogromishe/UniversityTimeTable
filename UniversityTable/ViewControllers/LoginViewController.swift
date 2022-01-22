//
//  LoginViewController.swift
//  UniversityTable
//
//  Created by Снытин Ростислав on 11.01.2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var backgroundGradientView: UIView!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var loginTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loadingView: UIView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gradientSetup()
        loginButton.layer.cornerRadius = loginButton.frame.height / 2
        loginTextField.clearsOnBeginEditing = true
        passwordTextField.clearsOnBeginEditing = true
        loadingView.isHidden = true
        loadingIndicator.isHidden = true
    }
    
    func gradientSetup() {
        let startColor = UIColor(red: 53 / 255,
                                 green: 61 / 255,
                                 blue: 100 / 255,
                                 alpha: 0)
        let secondColor = UIColor(red: 53 / 255,
                                  green: 61 / 255,
                                  blue: 100 / 255,
                                  alpha: 0.9)
        let endColor = UIColor(red: 53 / 255,
                               green: 61 / 255,
                               blue: 100 / 255,
                               alpha: 1)
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [startColor.cgColor, secondColor.cgColor, endColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        gradientLayer.frame = self.backgroundGradientView.bounds
        self.backgroundGradientView.layer.insertSublayer(gradientLayer, at: 0)
    }
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        if loginTextField.text == "login" && passwordTextField.text == "123" {
            UIView.animate(withDuration: 30.0, animations: {
                    self.loadingView.isHidden = false
                    self.loadingIndicator.isHidden = false
                    self.loadingIndicator.startAnimating()
                }, completion: { finished in
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(3)) {
                        self.loadingIndicator.stopAnimating()
                        self.performSegue(withIdentifier: "login", sender: self) }
                })
            
        } else {
            let action = UIAlertController(title: "Ошибка",
                                           message: "Ваш логин: login Ваш пароль: 123",
                                           preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK",
                                         style: .default)
            action.addAction(okAction)
            present(action, animated: true)
        }
    }
    
}
