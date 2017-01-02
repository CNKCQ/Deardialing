//
//  SettingController.swift
//  Deardialing
//
//  Created by KingCQ on 2016/12/25.
//  Copyright © 2016年 KingCQ. All rights reserved.
//

import UIKit

class SettingController: GroupDatil {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "更多"
        items = [
            [
                Item(title: "作者", subtitle: "星辰变"),
                Item(title: "github", subtitle: "CNKCQ", uri: "https://github.com/CNKCQ")
            ],
            [
                Item(title: "关于"),
                Item(title: "版本")
            ]
        ]
    }
}
