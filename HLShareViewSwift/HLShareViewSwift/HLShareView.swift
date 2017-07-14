//
//  HLShareView.swift
//  HLShareViewSwift
//
//  Created by 杜海龙 on 16/9/3.
//  Copyright © 2016年 DHL. All rights reserved.
//

import UIKit

protocol HLShareViewDelegate{

    func shareViewDicSelectButWithTag(view:UIView,btnTag:NSInteger)
}


class HLShareView: UIView {
    
    let screen_width = UIScreen.mainScreen().bounds.size.width
    let screen_height = UIScreen.mainScreen().bounds.size.height

    var delegate:HLShareViewDelegate?

  
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.grayColor()
        
        createView()
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func shareShow(){
    
        let keyWindow = UIApplication.sharedApplication().keyWindow
        UIView.animateWithDuration(0.38) { () -> Void in
            keyWindow?.addSubview(self)
        }
    
    }
    
    func createView() {
        
        //share view
        let shareBodyView = UIView(frame: CGRect(x: 20, y: (screen_height-200)/2, width: screen_width-40, height: 200))
        shareBodyView.backgroundColor     = UIColor.whiteColor()
        shareBodyView.layer.cornerRadius  = 5
        shareBodyView.layer.masksToBounds = true
        self.addSubview(shareBodyView)
        
        
        let positionX = 20+((screen_width-40)/4-49)/2
        let positionY = (screen_height-200)/2+10
        
        //no1
        let noOneButton    = creatBtn(CGRect(x: positionX, y: (screen_height-200)/2+10, width: 49, height: 49), image: UIImage.init(named:"UMS_wechat_icon")!, animationFrame: CGRect(x: 20+((screen_width-40)/4-49)/2, y: (screen_height-200)/2+10+10, width: 49, height: 49), agterDelay: 0)
        noOneButton.tag = 1
        noOneButton.layer.cornerRadius = 49/2
        noOneButton.layer.masksToBounds = true
        noOneButton.backgroundColor = UIColor.orangeColor()
        noOneButton.addTarget(self, action: "shareButtonClick:", forControlEvents: .TouchUpInside)
        
        //no2
        let noTwoButton    = creatBtn(CGRect(x: positionX+(screen_width-40)/4, y: (screen_height-200)/2+10, width: 49, height: 49), image: UIImage.init(named:"UMS_wechat_icon")!, animationFrame: CGRect(x: positionX+(screen_width-40)/4, y: (screen_height-200)/2+10+10, width: 49, height: 49), agterDelay: 0)
        noTwoButton.tag = 2
        noTwoButton.layer.cornerRadius = 49/2
        noTwoButton.layer.masksToBounds = true
        noTwoButton.backgroundColor = UIColor.orangeColor()
        noTwoButton.addTarget(self, action: "shareButtonClick:", forControlEvents: .TouchUpInside)
        
        //no3
        let noThreeButton    = creatBtn(CGRect(x: positionX+(screen_width-40)/4*2, y: (screen_height-200)/2+10, width: 49, height: 49), image: UIImage.init(named:"UMS_wechat_icon")!, animationFrame: CGRect(x: positionX+(screen_width-40)/4*2, y: (screen_height-200)/2+10+10, width: 49, height: 49), agterDelay: 0)
        noThreeButton.tag = 3
        noThreeButton.layer.cornerRadius = 49/2
        noThreeButton.layer.masksToBounds = true
        noThreeButton.backgroundColor = UIColor.orangeColor()
        noThreeButton.addTarget(self, action: "shareButtonClick:", forControlEvents: .TouchUpInside)
        
        //no4
        let noFourButton    = creatBtn(CGRect(x: positionX+(screen_width-40)/4*3, y: (screen_height-200)/2+10, width: 49, height: 49), image: UIImage.init(named:"UMS_wechat_icon")!, animationFrame: CGRect(x: positionX+(screen_width-40)/4*3, y: (screen_height-200)/2+10+10, width: 49, height: 49), agterDelay: 0)
        noFourButton.tag = 4
        noFourButton.layer.cornerRadius = 49/2
        noFourButton.layer.masksToBounds = true
        noFourButton.backgroundColor = UIColor.orangeColor()
        noFourButton.addTarget(self, action: "shareButtonClick:", forControlEvents: .TouchUpInside)
        
        //no5
        let noFiveButton    = creatBtn(CGRect(x: positionX, y: positionY+100, width: 49, height: 49), image: UIImage.init(named:"UMS_wechat_icon")!, animationFrame: CGRect(x: positionX, y: positionY+100+10, width: 49, height: 49), agterDelay: 0)
        noFiveButton.tag = 5
        noFiveButton.layer.cornerRadius = 49/2
        noFiveButton.layer.masksToBounds = true
        noFiveButton.backgroundColor = UIColor.orangeColor()
        noFiveButton.addTarget(self, action: "shareButtonClick:", forControlEvents: .TouchUpInside)
        
        //no6
        let noSixButton    = creatBtn(CGRect(x: positionX+(screen_width-40)/4, y: positionY+100, width: 49, height: 49), image: UIImage.init(named:"UMS_wechat_icon")!, animationFrame: CGRect(x: positionX+(screen_width-40)/4, y: positionY+100+10, width: 49, height: 49), agterDelay: 0)
        noSixButton.tag = 6
        noSixButton.layer.cornerRadius = 49/2
        noSixButton.layer.masksToBounds = true
        noSixButton.backgroundColor = UIColor.orangeColor()
        noSixButton.addTarget(self, action: "shareButtonClick:", forControlEvents: .TouchUpInside)
        
    }
    
    
    func shareButtonClick(sender:UIButton){
        
        for var i = 0; i<self.subviews.count; ++i{
        
            let view = self.subviews[i];
            if(view.isKindOfClass(UIButton)){
                UIView.animateWithDuration(0.3, delay: NSTimeInterval.init(0.38), options: UIViewAnimationOptions.TransitionCurlDown, animations: { () -> Void in
                    
                    view.frame = CGRect(x: view.frame.origin.x, y: ((self.screen_height-200)/2+10), width: 49, height: 49);
                    }) {(finshed:Bool) -> Void in }
            }
        }
        
        self.performSelector("removeView:", withObject: sender, afterDelay: 0.38)
        
        
    }
    
    
    func removeView(sender:UIButton){
        UIView.animateWithDuration(0.38) { () -> Void in
            self.removeFromSuperview()
        }
    
        self.delegate?.shareViewDicSelectButWithTag(self, btnTag: sender.tag)
    }
    
    
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
     
        //let touchPoint: CGPoint! = touches.anyObject()?.locationInView(self)

        let currentPoint =  (touches as NSSet).anyObject()?.locationInView(self)
        let currentY = currentPoint?.y
        if(currentY<(self.screen_height-200)/2||currentY>(self.screen_height-200)/2+200){
        
            for var i = 0; i<self.subviews.count; ++i{
                
                print(i)
                
                let view = self.subviews[i];
                if(view.isKindOfClass(UIButton)){
                    
                    print(i)
                    
                    UIView.animateWithDuration(0.2, delay: NSTimeInterval.init(0.18), options: UIViewAnimationOptions.TransitionCurlDown, animations: { () -> Void in
                        
                        if(i>4){
                            view.frame = CGRect(x: view.frame.origin.x, y: ((self.screen_height-200)/2+100+10), width: 49, height: 49);
                        }else{
                            view.frame = CGRect(x: view.frame.origin.x, y: ((self.screen_height-200)/2+10), width: 49, height: 49);
                        }
                        
                        }) {(finshed:Bool) -> Void in
                    
                            self.removeFromSuperview()
                    }
                }
            }
            
        }
        
    }
        
    
    
    
    func creatBtn(frame:CGRect,image:UIImage,animationFrame:CGRect,agterDelay:CGFloat) ->UIButton{
    
        let shareButton = UIButton(frame: frame)
        shareButton.setBackgroundImage(image, forState: .Normal)
        self .addSubview(shareButton)
        

        UIView.animateWithDuration(1.0, delay: NSTimeInterval.init(agterDelay), usingSpringWithDamping: 0.2, initialSpringVelocity: 0, options: UIViewAnimationOptions.AllowUserInteraction, animations: { () -> Void in
            shareButton.frame = animationFrame
            }) { (fnished:Bool) -> Void in}
        
        
        //usingSpringWithDamping :弹簧动画的阻尼值，也就是相当于摩擦力的大小，该属性的值从0.0到1.0之间，越靠近0，阻尼越小，弹动的幅度越大，反之阻尼越大，弹动的幅度越小，如果大道一定程度，会出现弹不动的情况。
        
        //initialSpringVelocity  :弹簧动画的速率，或者说是动力。值越小弹簧的动力越小，弹簧拉伸的幅度越小，反之动力越大，弹簧拉伸的幅度越大。这里需要注意的是，如果设置为0，表示忽略该属性，由动画持续时间和阻尼计算动画的效果。
        
        return shareButton
        
    }
    
    
    
    
    
    
    
    
    
    
}
