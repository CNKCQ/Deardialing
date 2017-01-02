//
//  CustomCell.swift
//  ListKitDemo
//
//  Created by KingCQ on 2016/12/16.
//  Copyright © 2016年 KingCQ. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell, Reusable {
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .value1, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
