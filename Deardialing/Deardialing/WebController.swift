//
//  WebController.swift
//  Deardialing
//
//  Created by KingCQ on 2017/1/2.
//  Copyright © 2017年 KingCQ. All rights reserved.
//

import UIKit
import WebKit

class WebController: UIViewController, WKNavigationDelegate {
    var webView: WKWebView!
    var uri = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView = WKWebView(frame: view.bounds)
        view.addSubview(webView)
        guard let url = URL(string: uri) else {
            return
        }
        webView.navigationDelegate = self
        webView.load(URLRequest(url: url))
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webView.title
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        webView.frame = view.bounds
    }
}
