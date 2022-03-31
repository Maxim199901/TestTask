//
//  ViewController.swift
//  TestTask
//
//  Created by Максим Кузнецов on 30.03.2022.
//

import UIKit
import Alamofire
import SnapKit

class ViewController: UIViewController {
    
    var mainView: View {
        return view as! View
    }
    
    override func loadView() {
        view = View()
    }
    
    var drinksArray = [String]()
    var tagButtons = [UIButton]()
    
    let tagHeight:CGFloat = 20
    let tagPadding: CGFloat = 16
    let tagSpacingX: CGFloat = 8
    let tagSpacingY: CGFloat = 8

    override func viewDidLoad() {
        super.viewDidLoad()
        getList()
        
        mainView.textField.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
    }

}

fileprivate extension ViewController {
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height - 20
                UIView.animate(withDuration: 0.4, animations: {
                    self.mainView.textField.layer.cornerRadius = 0
                    self.mainView.textField.snp.remakeConstraints { make in
                        make.left.equalToSuperview()
                        make.right.equalToSuperview()
                        make.bottom.equalTo(self.mainView.safeAreaLayoutGuide.snp.bottom).offset(-16.0)
                        make.height.equalTo(48.0)
                    }
                })
            }
        }
    }
    
    func getList() {
        AF.request("https://www.thecocktaildb.com/api/json/v1/1/filter.php?a=Non_Alcoholic", method: .get, encoding: JSONEncoding.default).response { response in
            if let data = response.data, let decodableObj = CodableHelper.decode(APIDrinks.self, from: data).decodableObj {
                decodableObj.drinks.forEach { drink in
                    self.drinksArray.append(drink.strDrink ?? "")
                    let button = UIButton()
                    button.setTitle(drink.strDrink, for: .normal)
                    button.backgroundColor = .lightGray
                    button.applyGradient(colours: [.red, .purple], locations: nil)
                    let index = self.drinksArray.firstIndex(of: drink.strDrink ?? "")
                    button.tag = index!
                    button.layer.cornerRadius = 10
                    button.frame.size.width = button.intrinsicContentSize.width + self.tagPadding
                    button.frame.size.height = self.tagHeight
                    button.addTarget(self, action: #selector(self.click), for: .touchUpInside)
                    self.tagButtons.append(button)
                    self.mainView.view1.addSubview(button)
                }
            }
            self.displayTagLabels()
        }
        
    }
    
    @objc func click(_ sender: UIButton) {

        sender.applyGradient(colours: [.red, .purple], locations: nil)
    }
    
    func displayTagLabels() {
        let containerWidth = mainView.view1.frame.size.width
        
        var currentOriginX: CGFloat = 0
        var currentOriginY: CGFloat = 0
        
        tagButtons.forEach { button in
            
            if currentOriginX + button.frame.width > containerWidth {
                currentOriginX = 0
                currentOriginY += tagHeight + tagSpacingY
            }
            
            button.frame.origin.x = currentOriginX
            button.frame.origin.y = currentOriginY
            
            currentOriginX += button.frame.width + tagSpacingX
            
            mainView.view1.snp.remakeConstraints { make in
                make.height.equalToSuperview()
                make.width.equalToSuperview()
            }
        }
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        drinksArray.forEach { drink in
            if textField.text == drink {
                let index = self.drinksArray.firstIndex(of: drink )
                for view in mainView.view1.subviews{
                    if view.tag == index {
                        view.applyGradient(colours: [.red, .purple], locations: nil)
                    }
                }
            }
        }
    }
}
