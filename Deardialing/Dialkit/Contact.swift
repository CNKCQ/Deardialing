//
//  Contact.swift
//  Deardialing
//
//  Created by KingCQ on 2016/11/29.
//  Copyright © 2016年 KingCQ. All rights reserved.
//


import UIKit

open class Contact: NSObject, NSCoding {
    public var familyName = ""
    public var givenName = ""
    public var phoneNumber = ""
    public var imageData = Data()
    
    public init(familyName: String, givenName: String, phoneNumber: String?, imageData: Data?) {
        self.familyName = familyName
        self.givenName = givenName
        self.phoneNumber = phoneNumber ?? ""
        self.imageData = imageData ?? Data()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        familyName = aDecoder.decodeObject(forKey: "familyName") as? String ?? ""
        givenName = aDecoder.decodeObject(forKey: "givenName") as? String ?? ""
        phoneNumber = aDecoder.decodeObject(forKey: "phoneNumber") as? String ?? ""
        imageData = aDecoder.decodeObject(forKey: "imageData") as? Data ?? Data()
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(familyName, forKey: "familyName")
        aCoder.encode(givenName, forKey: "givenName")
        aCoder.encode(phoneNumber, forKey: "phoneNumber")
        aCoder.encode(imageData, forKey: "imageData")
    }
}
