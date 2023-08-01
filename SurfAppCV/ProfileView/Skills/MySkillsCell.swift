//
//  MySkillsCell.swift
//  SurfAppCV
//
//  Created by Георгий Матченко on 01.08.2023.
//

import UIKit

class MySkillsCell: UITableViewCell {
    static let reuseID = "MySkillsCell"
    
    private weak var delegateToView: DelegateToView?
    weak var delegateToConroller: DelegateToController?
    
    private var buttonIsHiddenStatus = true
    
    private var skills: [Skill] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    private lazy var collectionView: UICollectionView = {
        let flowLayout = LeftAlignedCollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumInteritemSpacing = 12
        flowLayout.minimumLineSpacing = 12
        let collection = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collection.dataSource = self
        collection.delegate = self
        collection.isScrollEnabled = true
        collection.collectionViewLayout = flowLayout
        collection.register(SkillCell.self, forCellWithReuseIdentifier: SkillCell.reuseID)
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configureHeight()
    }
    
    private func configureHeight() {
        let addWidth: CGFloat = buttonIsHiddenStatus ? 45 : 70
       
        var height:CGFloat = 40
        var widthLine: CGFloat = 0
        var numberLines:CGFloat = 1
        let collectionWidth = UIScreen.main.bounds.width - 40
        for item in skills {
            let width = CGFloat(Int(String().getTextWidth(item.title) + addWidth))
            widthLine += width
            if collectionWidth < widthLine {
                height += 52
                widthLine = width
                numberLines += 1
            }
        }
        let result = (numberLines * 52 - 12)
        collectionView.removeConstraints(collectionView.constraints)
        collectionView.heightAnchor.constraint(equalToConstant: result).isActive = true
    }
    
    private func setupView() {
        contentView.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
}

//MARK: UICollectionViewDataSource
extension MySkillsCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        skills.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SkillCell.reuseID, for: indexPath) as? SkillCell else { return UICollectionViewCell()}
        let skill = skills[indexPath.row]
        cell.passInfoBack = self
        delegateToView = cell
        delegateToView?.passToView(skill)
        delegateToView?.passToView(buttonIsHiddenStatus)
        return cell
    }
}

//MARK: UICollectionViewDelegateFlowLayout
extension MySkillsCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let string = skills[indexPath.row].title
        let addWidth: CGFloat = buttonIsHiddenStatus ? 45 : 60
        let width = CGFloat(Int(String().getTextWidth(string)) + Int(addWidth))
        let height = CGFloat(40)
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if skills[indexPath.item].title == "+" {
            delegateToConroller?.passToController(self)
        }
    }
}

//MARK: DelegateToView
extension MySkillsCell: DelegateToView {
    func passToView<T>(_ info: T) {
        if let skills = info as? [Skill] {
            self.skills = skills
            layoutSubviews()
        }
        
        if let buttonStatus = info as? Bool {
            buttonIsHiddenStatus = buttonStatus
        }
    }
}

//MARK: DelegateToController
extension MySkillsCell: DelegateToController {
    func passToController<T>(_ info: T) {
        if let skillID = info as? Int {
            skills.removeAll(where: {$0.id == skillID})
            delegateToConroller?.passToController(skillID)
        }
    }
}
