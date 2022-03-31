//
//  View.swift
//  TestTask
//
//  Created by Максим Кузнецов on 30.03.2022.
//

import SnapKit
import UIKit

class View: UIView {
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.autoresizingMask = .flexibleHeight
        scrollView.showsVerticalScrollIndicator = false
        scrollView.alwaysBounceVertical = true
        scrollView.contentInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 16.0, right: 0.0)
        
        return scrollView
    }()
    
    let textField: UITextField = {
        let textField = UITextField()
        
        textField.layer.cornerRadius = 10
        textField.backgroundColor = .white
        textField.textAlignment = .center
        textField.textColor = .black
        textField.layer.masksToBounds = false
        textField.layer.shadowRadius = 3.0
        textField.layer.shadowColor = UIColor.black.cgColor
        textField.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        textField.layer.shadowOpacity = 1.0
        textField.attributedPlaceholder = NSAttributedString(
            string: "Coctail me",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
    
        )
        
        return textField
    }()
    
    let view1: UIView = {
        let view = UIView()
        
        return view
    }()
    
    let view: UIView = {
        let view = UIView()
        
        return view
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        addSubview(scrollView)
        view1.addSubview(view)
        view1.addSubview(textField)
        addSubview(textField)
        scrollView.addSubview(view1)

        
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(10)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        view1.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        view.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
        }
        
        textField.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(21.0)
            make.right.equalToSuperview().offset(-21.0)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-16.0)
            make.height.equalTo(48.0)
        }
        
    }
}
