//
//  SkillCell.swift
//  SurfAppCV
//
//  Created by Георгий Матченко on 01.08.2023.
//

import UIKit

class SkillCell: UICollectionViewCell {
    static let reuseID = "SkillCell"
    
    weak var passInfoBack: DelegateToController?
    
    private lazy var deleteButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .systemGray
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(deleteAction), for: .touchUpInside)
        return button
    }()
    
    private lazy var skillLabel: UILabel = {
       let label = UILabel()
        label.backgroundColor = .systemGray6
        label.textColor = .black
        label.layer.cornerRadius = self.bounds.height / 4
        label.clipsToBounds = true
        label.textAlignment = .center
        label.font = .helvetica14
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(skillLabel)
        contentView.addSubview(deleteButton)
        setConstraintsSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConstraintsSubviews() {
        NSLayoutConstraint.activate([
            skillLabel.topAnchor.constraint(equalTo: self.topAnchor),
            skillLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            skillLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            skillLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            deleteButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            deleteButton.centerYAnchor.constraint(equalTo: skillLabel.centerYAnchor),
            deleteButton.heightAnchor.constraint(equalToConstant: 12),
            deleteButton.widthAnchor.constraint(equalToConstant: 12)
        ])
    }
}

//MARK: DelegateToView
extension SkillCell: DelegateToView {
    func passToView<T>(_ info: T) {
        if let text = info as? Skill {
            skillLabel.text = text.title
            deleteButton.tag = text.id
        }
        
        if let status = info as? Bool {
            guard skillLabel.text != "+" else { return deleteButton.isHidden = true }
            deleteButton.isHidden = status
            
        }
    }
}

//MARK: Actions
extension SkillCell {
    @objc private func deleteAction() {
        passInfoBack?.passToController(self.deleteButton.tag)
    }
}
