//
//  BlurEffectMenu.swift
//  BlurEffectMenu_Swift
//
//  Created by 刘隆昌 on 16/7/11.
//  Copyright © 2016年 刘隆昌. All rights reserved.
//

import UIKit


protocol BlurEffectMenuDelegate {
    
//    点击背景dismiss
    func blurEffectMenuDidTapOnBackground(_ menu:BlurEffectMenu)
//    点击item
    func blurEffect(_ Menu:BlurEffectMenu,didTapOnItem item:BlurEffectMenuItem)
    
}


class BlurEffectMenuItem: NSObject {
    
    var title : String! //标题
    var icon : UIImage! //图标
    
}


class BlurEffectMenu: UIViewController{

    var delegate:BlurEffectMenuDelegate!
    var menuItemArr : NSArray!
    
    convenience init(menus:NSArray){
        self.init()
        self.menuItemArr = menus
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.view.backgroundColor = UIColor.clear
        
//        手势
        self.gesture()
//          布局
        self.setUpView()
        
        
        // Do any additional setup after loading the view.
    }

    
    func gesture(){
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self,action: #selector(BlurEffectMenu.didTapOnBackground(_:))))
        
        let swipeGesture = UISwipeGestureRecognizer(target: self,action: #selector(BlurEffectMenu.didTapOnBackground(_:)))
        
        swipeGesture.direction = .up
        self.view.addGestureRecognizer(swipeGesture)
        
    }
    
    
    func customAnimation(){
        
        
        for view in self.view.subviews {
            
            if view is UIButton {
                
                let btn : UIButton = view as! UIButton
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double((__int64_t)(UInt64(0.05)*NSEC_PER_SEC)) / Double(NSEC_PER_SEC), execute: {
                    
                    UIView.animate(withDuration: 1, delay: 0.02*(Double(btn.tag)), usingSpringWithDamping: 0.6, initialSpringVelocity: 1.5, options: UIViewAnimationOptions(), animations: {
                        
                        btn.frame = CGRect(x: btn.frame.origin.x, y: -300, width: btn.frame.size.width, height: btn.frame.size.height)
                        
                        
                        }, completion: { (finish) in
                            
                    })
                   
                })
                
                
            }
            
            
            
            
            if view is UILabel {
                
                let label : UILabel = view as! UILabel
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double((__int64_t)(UInt64(0.05)*NSEC_PER_SEC)) / Double(NSEC_PER_SEC), execute: {
                    
                    UIView.animate(withDuration: 1, delay: 0.02*(Double(label.tag)), usingSpringWithDamping: 0.6, initialSpringVelocity: 1.5, options: UIViewAnimationOptions(), animations: {
                        
                        label.textColor = UIColor.clear
                        
                        }, completion: { (finish) in
                            
                    })
                    
                })
                
                
            }
            
           
            
        }
        
        
        
        
        
    }
    
    func didTapOnBackground(_ tap:UITapGestureRecognizer){
        
//        点击空白处 dismiss
        self.customAnimation()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double((__int64_t)(UInt64(0.3)*NSEC_PER_SEC)) / Double(NSEC_PER_SEC)) {
            
//            刘锱歌
            if self.delegate != nil {
                
                self.delegate.blurEffectMenuDidTapOnBackground(self)
                
            }
            
        }
       
    }
    
    func itemBtnClicked(_ sender:UIButton){
        
//        点击按钮缩放代码
        UIView.animate(withDuration: 0.25, animations: {
            
            sender.transform = CGAffineTransform(scaleX: 1.7, y: 1.7)
            
            }, completion: { (finsh) in
                
        }) 
        
//        button dismiss动画 Sring Animation
        self.customAnimation()

        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double((__int64_t)(UInt64(0.3)*NSEC_PER_SEC)) / Double(NSEC_PER_SEC)) {
            
            
            if self.delegate != nil {
                
                self.delegate.blurEffect(self, didTapOnItem: self.menuItemArr[sender.tag] as! BlurEffectMenuItem)
                
            }
            
        }
        
    }
    
    func setUpView(){
        
//        毛玻璃
        let blurEffect = UIBlurEffect(style:.light)
        let visualEffectView = UIVisualEffectView(effect:blurEffect)
        visualEffectView.frame = self.view.bounds
        self.view.addSubview(visualEffectView)
        
//        三列
        let totaloc : CGFloat = 3
        let appViewW: CGFloat = 80
        let appVIewH: CGFloat = 80
        let margin = (self.view.frame.size.width - totaloc*appViewW)/(totaloc+1)
        for idx in 0..<self.menuItemArr.count {
            
            
            let row = idx/Int(totaloc) //行号
            let loc = CGFloat(idx).truncatingRemainder(dividingBy: totaloc) //列号
            let appViewX = margin + (margin+appViewW)*loc
            let appViewY : CGFloat = CGFloat( 100 +  (Int(50+appVIewH))*row )
//            button
            let button = UIButton(type:.custom)
            button.frame = CGRect(x: appViewX, y: -300, width: appViewW, height: appVIewH)
            button.tag = idx
            button.addTarget(self, action: #selector(BlurEffectMenu.itemBtnClicked(_:)), for: .touchUpInside)
            self.view.addSubview(button)
//            Label
            
            
            let label = UILabel()
            label.frame = CGRect(x: appViewX, y: button.frame.origin.y + button.bounds.size.height+5, width: appViewW, height: 25)
            label.textColor = UIColor.gray
            label.font = UIFont.systemFont(ofSize: 14.0)
            label.textAlignment = .center
            label.tag = idx
            self.view.addSubview(label)
            
            let item : BlurEffectMenuItem = self.menuItemArr[idx] as! BlurEffectMenuItem
            button.setImage(item.icon, for: UIControlState())
            label.text = item.title
            
            
            
            
            
            
            
            
            
//            Spring Animation
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double((__int64_t)(0.05*Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: {
                
//                UIView animate动画；仿丁丁弹出添加按钮， 从顶部弹到指定位置
                
                UIView.animate(withDuration: 1, delay: (0.2-0.02*Double(idx)), usingSpringWithDamping: 1.0, initialSpringVelocity: 15.0, options: UIViewAnimationOptions(), animations: {
                    
                    
                    button.frame = CGRect(x: appViewX, y: appViewY, width: appViewW, height: appVIewH)
                    label.frame = CGRect(x: appViewX, y: button.frame.origin.y+button.bounds.size.height+5, width: appViewW, height: 25)
                    
                    
                    }, completion: { (finish) in
                        
                })
               
            })
            
        }
        
        
        
        
        
    }
    
    
//    //    点击背景dismiss
//    func blurEffectMenuDidTapOnBackground(menu:BlurEffectMenu){
//        
//        
//        
//        
//        
//    }
//    //    点击item
//    func blurEffect(Menu:BlurEffectMenu,didTapOnItem item:BlurEffectMenuItem){
//        
//        
//        
//    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
