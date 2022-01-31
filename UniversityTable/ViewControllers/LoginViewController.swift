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
    
    
    #warning("Изучи жизненный цикл UIViewController, в этой статье отлично это расписано, но некоторые циклы уже устарели, соориентируйся, перейдя в методы класса UIViewController. https://habr.com/ru/post/129557/")
    #warning("viewDidLoad служит для настройки, но не для указания координат и размеров вьюх и CALayer")
    override func viewDidLoad() {
        super.viewDidLoad()
        gradientSetup()
        #warning("Хорошая статья про MVC https://habr.com/ru/post/500870/ и https://habr.com/ru/post/354326/")
        #warning("Брать frame/bounds вьюхи во viewDidLoad нет смысла, тк на этом этапе вью загружена, но её координаты и размеры неизвестны, код от этого становится непредсазуемым")
        loginButton.layer.cornerRadius = loginButton.frame.height / 2
        #warning("Не думаю что в данной случае эта настройка нужна, тк если клиент ошибётся в одной букве логина и при тыке на textField у него всё стерётся, получится не очень")
        loginTextField.clearsOnBeginEditing = true
        passwordTextField.clearsOnBeginEditing = true
        #warning("Когда у тебя будет в приложении куча мест, где нужно будет показать лоадер, тебе придётся в каждом месте на XIB или Storyboard добавлять такую вью с лоадером и скрывать её, получится очень много не нужной работы, используй ООП. Создай одну вью оотдельным классом(кодом, ксибом) и инициализируй/показывай её где угодно, только не забывай очищать её с экрана и из памяти, когда она больше не требуется")
        loadingView.isHidden = true
        loadingIndicator.isHidden = true
    }
    
    func gradientSetup() {
        #warning("Тоже самое, Swift даёт тебе возможность описывать расширения классов, можно описать метод инициализации цвета в этом расширении, чтобы добавлять туда целое число, а в самом методе пусть происходит это деление на 255, писать станет быстрее и приятнее. Проще же один раз описать и везде потом это использовать")
        let startColor = UIColor(red: 53 / 255,
                                 green: 61 / 255,
                                 blue: 100 / 255,
                                 alpha: 0)
        let secondColor = UIColor(red: 53 / 255,
                                  green: 61 / 255,
                                  blue: 100 / 255,
                                  alpha: 1)
        let endColor = UIColor(red: 53 / 255,
                               green: 61 / 255,
                               blue: 100 / 255,
                               alpha: 1)
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [startColor.cgColor, secondColor.cgColor, endColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        #warning("Здесь косяк с градиентом, его координаты указываются во время отработки метода viewDidLoad")
        gradientLayer.frame = self.backgroundGradientView.bounds
        #warning("Layer backgroundGradientView не имеет sublayer, так почему бы не использовать addSublayer? Так тоже можно, но логика непонятна")
        self.backgroundGradientView.layer.insertSublayer(gradientLayer, at: 0)
    }
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        #warning("Принято использовать метод elementsEqual у String")
        if loginTextField.text == "login" && passwordTextField.text == "123" {
            #warning("Используй [weak self], иначе этот код может упасть, когда ссылка на контроллер пропадёт. https://habr.com/ru/post/251325/")
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
