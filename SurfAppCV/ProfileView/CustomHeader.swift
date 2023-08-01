//
//  CustomHeader.swift
//  SurfAppCV
//
//  Created by Георгий Матченко on 01.08.2023.
//

import UIKit

class CustomHeader: UITableViewHeaderFooterView {
    static let reuseID = "CustomHeader"
    
    private lazy var background: UIView = {
       let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "О себе"
        label.font = .helvetica16
        return label
    }()
    
    private lazy var editButton: UIButton = {
        let button = UIButton(type: .system)
        return button
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        contentView.appendSubviewsToView(views: [background,titleLabel, editButton,])
        contentView.subviews.forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            
            editButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            editButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            background.widthAnchor.constraint(equalTo: self.widthAnchor),
            background.heightAnchor.constraint(equalTo: self.heightAnchor)
        ])
    }
}
