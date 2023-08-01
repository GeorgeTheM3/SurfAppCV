//
//  ProfileTableView.swift
//  SurfAppCV
//
//  Created by Георгий Матченко on 01.08.2023.
//

import UIKit

class ProfileTableView: UIViewController {
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height), style: .grouped)
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MySkillsCell.self, forCellReuseIdentifier: MySkillsCell.reuseID)
        tableView.register(ProfileHeader.self, forHeaderFooterViewReuseIdentifier: ProfileHeader.reuseID)
        tableView.register(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: "standartHeader")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "standartCell")
        tableView.backgroundColor = .red
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
        if let hobbyCell = tableView.dequeueReusableCell(withIdentifier: MySkillsCell.reuseID, for: indexPath) as? MySkillsCell {
            if indexPath.section == 1 {
                return hobbyCell
            }
        }
        // 2 type cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "standartCell", for: indexPath)
        return cell

    }
}


//MARK: UITableViewDelegate
extension ProfileTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let standartHeader = tableView.dequeueReusableHeaderFooterView(withIdentifier: "standartHeader")
        standartHeader?.textLabel?.font = UIFont(name: "Helvetica-Bold", size: 14)
        switch section {
        case 0:
            if let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: ProfileHeader.reuseID) as? ProfileHeader {
                return header
            }
        case 1:
            standartHeader?.textLabel?.text = "Мои навыки"
            return standartHeader
        case 2:
            standartHeader?.textLabel?.text = "О себе"
            return standartHeader
        default:
            return nil
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        section == 0 ? 290 : 10
    }
}
