//
//  TodayViewController.swift
//  dialing
//
//  Created by KingCQ on 2016/11/28.
//  Copyright © 2016年 KingCQ. All rights reserved.
//

import UIKit
import NotificationCenter
import Dialkit
import FaceAware

class TodayViewController: UIViewController, NCWidgetProviding {
    var contacts: [Contact] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setup()
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        contacts = (NSKeyedUnarchiver.unarchiveObject(withFile: groupFilePath) as? [Contact]) ?? []
        for (idx, contact) in contacts.enumerated() {
            let button = UIButton(frame: CGRect(x: idx * (60 + 15) + 15, y: 5, width: 60, height: 60))
            button.layer.cornerRadius = 30
            let image = UIImage(data: contact.imageData)
            button.setImage(image, for: .normal)
            button.clipsToBounds = true
            button.backgroundColor = UIColor.brown
            button.tag = idx
            button.addTarget(self, action: #selector(tap(sender:)), for: .touchUpInside)
            let nameLabel = UILabel(frame: CGRect(x: button.frame.minX, y: button.frame.maxY + 5, width: button.frame.width, height: 15))
            nameLabel.textAlignment = .center
            nameLabel.font = UIFont.systemFont(ofSize: 14)
            nameLabel.textColor = UIColor.darkText
            nameLabel.text = contact.familyName
            view.addSubview(button)
            view.addSubview(nameLabel)
        }
    }
    
    func tap(sender: UIButton) {
        /// See: http://www.cocoachina.com/bbs/read.php?tid=177141
        self.extensionContext?.open(URL(string: "tel://\(contacts[sender.tag].phoneNumber)".replacingOccurrences(of: " ", with: ""))!, completionHandler: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        contacts = NSKeyedUnarchiver.unarchiveObject(withFile: filePath) as? [Contact] ?? []
        completionHandler(NCUpdateResult.newData)
    }
    
}
