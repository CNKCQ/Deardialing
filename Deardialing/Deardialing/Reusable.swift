//
//  Reusable.swift
//  Deardialing
//
//  Created by KingCQ on 2016/12/16.
//  Copyright © 2016年 KingCQ. All rights reserved.
//

protocol Reusable: class {
    static var reuseIdentifier: String { get }
}

extension Reusable {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
