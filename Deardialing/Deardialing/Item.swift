//
//  Item.swift
//  Deardialing
//
//  Created by KingCQ on 2016/12/16.
//  Copyright © 2016年 KingCQ. All rights reserved.
//

import UIKit

class Item {
    var title: String = "标题"
    var subtitle: String = "副标题"
    var selectable: Bool = true
    var dest: UIViewController?
    var uri: String? = nil
    
    
    init(title: String, subtitle: String = "", dest: UIViewController? = nil, selectable: Bool = true, uri: String? = nil) {
        self.title = title
        self.subtitle = subtitle
        self.selectable = selectable
        self.dest = dest
        self.uri = uri
    }
    
}
