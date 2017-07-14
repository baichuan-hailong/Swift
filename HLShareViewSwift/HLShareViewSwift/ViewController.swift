//
//  ViewController.swift
//  HLShareViewSwift
//
//  Created by 杜海龙 on 16/9/3.
//  Copyright © 2016年 DHL. All rights reserved.
//

import UIKit


class ViewController: UIViewController,HLShareViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let shareButton    = UIButton(frame: CGRect(x: 0, y: 200, width: self.view.frame.size.width, height: 50))
        shareButton.setTitle("ShareButtton", forState: .Normal)
        shareButton.backgroundColor = UIColor.orangeColor()
        shareButton.addTarget(self, action: "shareButtonClick:", forControlEvents: .TouchUpInside)
        self.view.addSubview(shareButton)
    }

    
    func shareButtonClick(sender:UIButton){
    
        print("share")
        let shareView = HLShareView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))
        shareView.delegate = self
        shareView.shareShow()
    }
    
    func shareViewDicSelectButWithTag(view: UIView, btnTag: NSInteger) {
        print(btnTag)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

