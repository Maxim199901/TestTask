//
//  DrinkButton.swift
//  TestTask
//
//  Created by Максим Кузнецов on 30.03.2022.
//

import UIKit
import SnapKit

class DrinkButton: UIView {
    
    let button: UIButton = {
        let button = UIButton()
        
        button.titleLabel?.textColor = .black
        button.layer.cornerRadius = 12
        button.backgroundColor = .red
        
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius = 12
        backgroundColor = .red
        
        addSubview(button)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        
        button.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(30)
            make.centerX.equalToSuperview()
            make.trailing.lessThanOrEqualToSuperview().inset(2)
        }
        
    }
    
}

