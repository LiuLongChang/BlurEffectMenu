//
//  ViewController.swift
//  BlurEffectMenu_Swift
//
//  Created by 刘隆昌 on 16/7/11.
//  Copyright © 2016年 刘隆昌. All rights reserved.
//

import UIKit

let kScreenWidth = UIScreen.mainScreen().bounds.size.width

let kScreenHeight = UIScreen.mainScreen().bounds.size.height





class ViewController: UIViewController,BlurEffectMenuDelegate {
    
    var btn : UIButton = {
    
    
        
    
        let btn = UIButton(type: .Custom)
        
        btn.frame = CGRectMake(kScreenWidth/2-30.0, kScreenHeight-49.0-60.0, 60.0, 60.0)
        
        btn.setTitle("点击", forState: .Normal)
        
        btn.setTitleColor(UIColor.blueColor(), forState: .Normal)
        
        btn.layer.borderWidth = 0.5
        
        btn.layer.borderColor = UIColor.darkGrayColor().CGColor
        
        btn.layer.cornerRadius = 30.0
        
        btn.layer.masksToBounds = true
        
        btn.backgroundColor = UIColor.lightGrayColor()
        
        
        return btn
    
    } ()

    
    func btnClicked(btn:UIButton){
        
        let addMattersItem = BlurEffectMenuItem()
        addMattersItem.title = "添加事项"
        addMattersItem.icon = UIImage(named: "addMatters")
        
        
        let addSchedulesItem = BlurEffectMenuItem()
        addSchedulesItem.title = "添加日程"
        addSchedulesItem.icon = UIImage(named: "addSchedule")
        
        
        let setupChatItem = BlurEffectMenuItem()
        setupChatItem.title = "发起会话"
        setupChatItem.icon = UIImage(named: "setupChat")
        
        
        let searchContactsItem = BlurEffectMenuItem()
        searchContactsItem.title = "查找联系人"
        searchContactsItem.icon = UIImage(named: "searchContacts")
        
        
        let menu = BlurEffectMenu(menus:[addMattersItem,addSchedulesItem,setupChatItem,searchContactsItem,addMattersItem])
        menu.delegate = self
        menu.modalPresentationStyle = .OverFullScreen
        menu.modalTransitionStyle = .CrossDissolve
        self.presentViewController(menu, animated: true, completion: nil)
        
        
        
    }
    
    func blurEffectMenuDidTapOnBackground(menu: BlurEffectMenu) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    
    func blurEffect(Menu: BlurEffectMenu, didTapOnItem item: BlurEffectMenuItem) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.btn.addTarget(self, action: #selector(ViewController.btnClicked(_:)), forControlEvents: .TouchUpInside)
        
        
        self.view.addSubview(self.btn)
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

