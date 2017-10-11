//
//  ViewController.swift
//  BlurEffectMenu_Swift
//
//  Created by 刘隆昌 on 16/7/11.
//  Copyright © 2016年 刘隆昌. All rights reserved.
//

import UIKit

let kScreenWidth = UIScreen.main.bounds.size.width

let kScreenHeight = UIScreen.main.bounds.size.height





class ViewController: UIViewController,BlurEffectMenuDelegate {
    
    var btn : UIButton = {
    
    
        
    
        let btn = UIButton(type: .custom)
        
        btn.frame = CGRect(x: kScreenWidth/2-30.0, y: kScreenHeight-49.0-60.0, width: 60.0, height: 60.0)
        
        btn.setTitle("点击", for: UIControlState())
        
        btn.setTitleColor(UIColor.blue, for: UIControlState())
        
        btn.layer.borderWidth = 0.5
        
        btn.layer.borderColor = UIColor.darkGray.cgColor
        
        btn.layer.cornerRadius = 30.0
        
        btn.layer.masksToBounds = true
        
        btn.backgroundColor = UIColor.lightGray
        
        
        return btn
    
    } ()

    
    func btnClicked(_ btn:UIButton){
        
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
        menu.modalPresentationStyle = .overFullScreen
        menu.modalTransitionStyle = .crossDissolve
        self.present(menu, animated: true, completion: nil)
        
        
        
    }
    
    func blurEffectMenuDidTapOnBackground(_ menu: BlurEffectMenu) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    func blurEffect(_ Menu: BlurEffectMenu, didTapOnItem item: BlurEffectMenuItem) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(patternImage:UIImage(named: "bg")!)


        self.btn.addTarget(self, action: #selector(ViewController.btnClicked(_:)), for: .touchUpInside)
        
        
        self.view.addSubview(self.btn)
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

