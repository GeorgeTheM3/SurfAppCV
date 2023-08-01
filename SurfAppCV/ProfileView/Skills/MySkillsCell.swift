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
    
    private var buttonIsHiddenStatus = true
    
    private var skills: [Skill] = []
    
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
        let addWidth: CGFloat = buttonIsHiddenStatus ? 40 : 60
        var height:CGFloat = 40
        var widthLine: CGFloat = 0
        var numberLines:CGFloat = 1
        let collectionWidth = UIScreen.main.bounds.width - 40
        for str in skills {
            let width = CGFloat(Int(String().getTextWidth(str.title) + addWidth))
            widthLine += width
            if collectionWidth < widthLine {
                height += 52
                widthLine = width
                numberLines += 1
            }
        }
        let result = (numberLines * 52 - 12)
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

extension MySkillsCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        skills.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SkillCell.reuseID, for: indexPath) as? SkillCell else { return UICollectionViewCell()}
        let skill = skills[indexPath.row]
        delegateToView = cell
        delegateToView?.passToView(skill)
        delegateToView?.passToView(buttonIsHiddenStatus)
        return cell
    }
}

extension MySkillsCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let string = skills[indexPath.row].title
        let addWidth: CGFloat = buttonIsHiddenStatus ? 40 : 60
        let width = CGFloat(Int(String().getTextWidth(string)) + Int(addWidth))
        let height = CGFloat(40)
        return CGSize(width: width, height: height)
    }
}

extension MySkillsCell: DelegateToView {
    func passToView<T>(_ info: T) {
        if let skills = info as? [Skill] {
            self.skills = skills
            layoutSubviews()
        }
    }

}