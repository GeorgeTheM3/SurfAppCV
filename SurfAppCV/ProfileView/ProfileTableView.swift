//
//  ProfileTableView.swift
//  SurfAppCV
//
//  Created by Георгий Матченко on 01.08.2023.
//

import UIKit

class ProfileTableView: UIViewController {
    private weak var delegateToView: DelegateToView?
    
    private var storageService = StorageService()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height), style: .grouped)
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MySkillsCell.self, forCellReuseIdentifier: MySkillsCell.reuseID)
        tableView.register(ProfileHeader.self, forHeaderFooterViewReuseIdentifier: ProfileHeader.reuseID)
        tableView.register(CustomHeader.self, forHeaderFooterViewReuseIdentifier: CustomHeader.reuseID)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "standartCell")
        tableView.backgroundColor = .systemGray6
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupView()
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.tintColor = .black
        navigationItem.title = "Профиль"
    }
    
    private func setupView() {
        view.addSubview(tableView)
    }
}

//MARK: UITableViewDataSource
extension ProfileTableView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        section == 0 ? 0 : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 1 type cell
        if let cell = tableView.dequeueReusableCell(withIdentifier: MySkillsCell.reuseID, for: indexPath) as? MySkillsCell {
            if indexPath.section == 1 {
                cell.delegateToConroller = self
                delegateToView = cell
                delegateToView?.passToView(storageService.getSkillsList())
                cell.selectionStyle = .none
                return cell
            }
        }
        // 2 type cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "standartCell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        let text = "Experienced software engineer skilled in developing scalable and maintainable systems"
        content.attributedText = NSAttributedString(string: text, attributes: [.font: UIFont.helvetica14])
        cell.contentConfiguration = content
        cell.selectionStyle = .none
        return cell

    }
}


//MARK: UITableViewDelegate
extension ProfileTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let standartHeader = tableView.dequeueReusableHeaderFooterView(withIdentifier: CustomHeader.reuseID) as? CustomHeader else { return nil}
        delegateToView = standartHeader
        switch section {
        case 0:
            if let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: ProfileHeader.reuseID) as? ProfileHeader {
                return header
            }
        case 1:
            delegateToView?.passToView(section)
            return standartHeader
        case 2:
            delegateToView?.passToView(section)
            return standartHeader
        default:
            return nil
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        section == 0 ? 280 : 35
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        0
    }
}

extension ProfileTableView: DelegateToController {
    func passToController<T>(_ info: T) {
        if let skillID = info as? Int {
            storageService.removeSkill(skillID)
            tableView.reloadSections(IndexSet(integer: 1), with: .automatic)
//            tableView.reloadData()
        }
    }
}
