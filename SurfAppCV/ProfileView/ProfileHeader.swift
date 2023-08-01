//
//  ProfileHeader.swift
//  SurfAppCV
//
//  Created by Георгий Матченко on 01.08.2023.
//

import UIKit

class ProfileHeader: UITableViewHeaderFooterView {
    static let reuseID = "ProfileHeader"
    
    private lazy var photoImageView: UIImageView = {
        let heightScreen = UIScreen.main.bounds.height
        let imageView = UIImageView()
        imageView.image = .avatar
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = heightScreen * 0.07
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 2
        label.text = "Иванов Иван Иванович"
        label.font = .helvetica25bold
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Middle iOS-разработчик, опыт более 2-х лет"
        label.font = .helvetica14
        return label
    }()
    
    private lazy var locationLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Воронеж"
        label.font = .helvetica14
        return label
    }()
    
    private lazy var pinImageView: UIImageView = {
        let heightScreen = UIScreen.main.bounds.height
        let imageView = UIImageView()
        imageView.image = .geoPin
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        contentView.appendSubviewsToView(views: [photoImageView, nameLabel, descriptionLabel, locationLabel, pinImageView])
        let screenSize = UIScreen.main.bounds.size
        contentView.subviews.forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            photoImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 25),
            photoImageView.heightAnchor.constraint(equalToConstant: screenSize.height * 0.14),
            photoImageView.widthAnchor.constraint(equalToConstant: screenSize.height * 0.14),
            photoImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: 16),
            nameLabel.centerXAnchor.constraint(equalTo: photoImageView.centerXAnchor),
            nameLabel.widthAnchor.constraint(equalToConstant: screenSize.width * 0.7),
            
            descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            descriptionLabel.centerXAnchor.constraint(equalTo: photoImageView.centerXAnchor),
            descriptionLabel.widthAnchor.constraint(equalToConstant: screenSize.width * 0.85),
            
            locationLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 5),
            locationLabel.centerXAnchor.constraint(equalTo: photoImageView.centerXAnchor, constant: 3),
            
            pinImageView.topAnchor.constraint(equalTo: locationLabel.topAnchor),
            pinImageView.trailingAnchor.constraint(equalTo: locationLabel.leadingAnchor, constant: -3),
            pinImageView.widthAnchor.constraint(equalTo: locationLabel.heightAnchor),
            pinImageView.heightAnchor.constraint(equalTo: locationLabel.heightAnchor)
        ])
    }
}
