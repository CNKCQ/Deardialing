//
//  Utils.swift
//  Deardialing
//
//  Created by KingCQ on 2016/11/28.
//  Copyright © 2016年 KingCQ. All rights reserved.
//

import Foundation

func findIndex<T: Equatable>(array: [T], valueToFind: T) -> Int? {
    for (idx, value) in array.enumerated() {
        if value == valueToFind {
            return idx
        }
    }
    return nil
}

var documentDirectory: String {
    let manager = FileManager.default
    let url = manager.urls(for: .documentDirectory, in: .userDomainMask).first!
    return url.appendingPathComponent("contacts").absoluteString
}

var filePath: String {
    return NSHomeDirectory().appending("/Documents/contacts")
}

var groupFilePath: String {
    return FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: "group.dialing.container")?.appendingPathComponent("contacts").absoluteString.replacingOccurrences(of: "file://", with: "") ?? ""
}

var documentFile: String {
    let manager = FileManager.default
    let url = manager.urls(for: .documentDirectory, in: .userDomainMask).first!
    return url.appendingPathComponent("contacts").absoluteString
}
