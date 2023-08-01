//
//  CustomHeader.swift
//  SurfAppCV
//
//  Created by Георгий Матченко on 01.08.2023.
//

import UIKit

class CustomHeader: UITableViewHeaderFooterView {
    static let reuseID = "CustomHeader"
    
    weak var delegateToController: DelegateToController?
    
    private var currentButtonImage: UIImage = .pencil
    
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
        button.setImage(currentButtonImage, for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(editAction), for: .touchUpInside)
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
            titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            
            editButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            editButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            background.widthAnchor.constraint(equalTo: self.widthAnchor),
            background.heightAnchor.constraint(equalTo: self.heightAnchor)
        ])
    }
}

extension CustomHeader: DelegateToView {
    func passToView<T>(_ info: T) {
        if let image = info as? UIImage {
            editButton.setImage(image, for: .normal)
        }
        
        guard let indexSection = info as? Int else { return }
        titleLabel.text = indexSection == 1 ? "Мои навыки" : "О себе"
        editButton.isHidden = indexSection == 1 ? false : true
    }
}

extension CustomHeader {
    @objc func editAction() {
        delegateToController?.passToController(self)
    }
}
