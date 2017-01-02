//
//  GroupDatil.swift
//  Deardialing
//
//  Created by KingCQ on 2016/12/17.
//  Copyright © 2016年 KingCQ. All rights reserved.
//

import UIKit

class GroupDatil: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var tableView: UITableView!
    var items: [[Item]] = [[]]
    var titles: [(String, String)] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = UITableView(frame: view.bounds, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(cellType: ItemCell.self)
        tableView.tableFooterView = UIView()
        view.addSubview(tableView)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: ItemCell.self)
        cell.textLabel?.text = items[indexPath.section][indexPath.row].title
        cell.detailTextLabel?.text = items[indexPath.section][indexPath.row].subtitle
        cell.accessoryType = items[indexPath.section][indexPath.row].selectable ? .disclosureIndicator : .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = items[indexPath.section][indexPath.row]
        if let url = item.uri {
            let dest = WebController()
            dest.uri = url
            navigationController?.pushViewController(dest, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if titles.count > section {
            return titles[section].0
        }
        return ""
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        if titles.count > section {
            return titles[section].1
        }
        return ""
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        tableView.frame = view.bounds
    }
}
