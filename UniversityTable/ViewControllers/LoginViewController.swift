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
    
    @IBOutlet weak var loadingView: LoadingView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginTextField.clearButtonMode = .whileEditing
        passwordTextField.clearButtonMode = .whileEditing
        //#warning("Когда у тебя будет в приложении куча мест, где нужно будет показать лоадер, тебе придётся в каждом месте на XIB или Storyboard добавлять такую вью с лоадером и скрывать её, получится очень много не нужной работы, используй ООП. Создай одну вью оотдельным классом(кодом, ксибом) и инициализируй/показывай её где угодно, только не забывай очищать её с экрана и из памяти, когда она больше не требуется")
        loadingView.isHidden = true
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
        //#warning("Че та не работает")
        if ((loginTextField.text?.elementsEqual("login")) != nil) && ((passwordTextField.text?.elementsEqual("123")) != nil) {
            //#warning("Используй [weak self], иначе этот код может упасть, когда ссылка на контроллер пропадёт. https://habr.com/ru/post/251325/")
            UIView.animate(withDuration: 30.0, animations: { [weak self] in
                guard let self = self else { return }
                self.loadingView.isHidden = false
                self.loadingView.configure()
                }, completion: { finished in
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(3)) { [weak self] in
                        self?.loadingView.loadingIndicator.stopAnimating()
                        self?.performSegue(withIdentifier: "login", sender: self)
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
