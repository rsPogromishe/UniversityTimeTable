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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginTextField.clearButtonMode = .whileEditing
        passwordTextField.clearButtonMode = .whileEditing
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        gradientSetup()
        loginButton.layer.cornerRadius = loginButton.frame.height / 2
    }
    
    func gradientSetup() {
        let startColor = UIColor.setColor(red: 53, green: 61, blue: 100, alpha: 0)
        let secondColor = UIColor.setColor(red: 53, green: 61, blue: 100, alpha: 1)
        let endColor = UIColor.setColor(red: 53, green: 61, blue: 100, alpha: 1)
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [startColor.cgColor, secondColor.cgColor, endColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        gradientLayer.frame = self.backgroundGradientView.bounds
        self.backgroundGradientView.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        if ((loginTextField.text?.elementsEqual("login")) == true) && ((passwordTextField.text?.elementsEqual("123")) == true)  {
            UIView.animate(withDuration: 3.0, animations: { [weak self] in
                guard let self = self else { return }
                LoadingView.startAnimating(mainView: self.view)
                }, completion: { finished in
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(3)) { [weak self] in
                        guard let self = self else { return }
                        LoadingView.stopAnimating()
                        self.performSegue(withIdentifier: "login", sender: self)
                    }
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
