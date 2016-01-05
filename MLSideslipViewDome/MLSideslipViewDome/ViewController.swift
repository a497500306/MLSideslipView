//
//  ViewController.swift
//  MLSideslipViewDome
//
//  Created by 洛耳 on 16/1/5.
//  Copyright © 2016年 workorz. All rights reserved.

import UIKit
//第一步继承--MLViewController
class ViewController: MLViewController , UITableViewDelegate , UITableViewDataSource {
    /// 侧滑栏图片数组
    var images : NSArray!
    /// 侧滑栏文字数组
    var texts : NSArray!
    override func viewDidLoad() {
        super.viewDidLoad()
        //设置左上角的放回按钮
        let righBtn = UIButton(frame: CGRectMake(0, 0, 24, 24))
        righBtn.setBackgroundImage(UIImage(named: "椭圆-19"), forState: UIControlState.Normal)
        righBtn.setBackgroundImage(UIImage(named: "椭圆-19" ), forState: UIControlState.Highlighted)
        righBtn.addTarget(self, action: "dianjiNavZuoshangjiao", forControlEvents: UIControlEvents.TouchUpInside)
        let rightBarItem = UIBarButtonItem(customView: righBtn)
        self.navigationItem.leftBarButtonItem = rightBarItem
        //第二步创建侧滑栏中需要添加的控件
        添加控件()
    }


    func 添加控件(){
        
        self.images = ["二维码","手势密码","指纹图标","我的收藏","设置"]
        self.texts = ["我的二维码","手势解锁","指纹解锁","我的收藏","设置"]
        let imageView = UIImageView(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width * 2 / 3  , UIScreen.mainScreen().bounds.height))
        imageView.userInteractionEnabled = true
        imageView.image = UIImage(named: "我的—背景图")
        let table = UITableView.init(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width * 2 / 3  , UIScreen.mainScreen().bounds.height))
        table.backgroundColor = UIColor.clearColor()
        table.tag = 1000
        table.separatorStyle = UITableViewCellSeparatorStyle.None
        //1添加头部控件
        let touView : UIView = UIView()
        //1.1头像
        let btn : UIButton = UIButton()
        let w : CGFloat = 75
        btn.frame = CGRectMake(((UIScreen.mainScreen().bounds.width * 2 / 3)-w)/2, w/2, w, w)
        //圆角
        btn.layer.cornerRadius = 10
        btn.layer.masksToBounds = true
        btn.setImage(UIImage(named: "IMG_1251.JPG"), forState: UIControlState.Normal)
        touView.addSubview(btn)
        //1.2名字
        let nameText : UILabel = UILabel()
        let WH : CGSize = MLGongju().计算文字宽高("2131231", sizeMake: CGSizeMake(10000, 10000), font: UIFont.systemFontOfSize(15))
        nameText.frame = CGRectMake(0, btn.frame.height + btn.frame.origin.y+10, table.frame.width, WH.height)
        nameText.font = UIFont.systemFontOfSize(15)
        nameText.textAlignment = NSTextAlignment.Center
        nameText.text = "毛哥哥是神"
        touView.addSubview(nameText)
        //1.3线
        let xian : UIView = UIView()
        xian.frame = CGRectMake(25, nameText.frame.height + nameText.frame.origin.y + 10, table.frame.width - 50, 0.5)
        xian.backgroundColor = UIColor(red: 149/255.0, green: 149/255.0, blue: 149/255.0, alpha: 1)
        touView.addSubview(xian)
        touView.frame = CGRectMake(0, 0, table.frame.width, xian.frame.origin.y + xian.frame.height + 10)
        table.tableHeaderView = touView
        //设置代理数据源
        table.dataSource = self
        table.delegate = self
        super.sideslipView.contentView.addSubview(imageView)
        super.sideslipView.contentView.addSubview(table)
    }//MARK: - tableView代理和数据源方法
    //多少行
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.images.count
    }
    //点击每行做什么
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //取消选择
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        //关闭侧滑栏
        super.down()
        print("在这里做跳转")
    }
    //MARK: - tableView代理数据源
    //每行cell张什么样子
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let ID  = "cell"
        var cell : UITableViewCell! = tableView.dequeueReusableCellWithIdentifier(ID)
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: ID)
        }
        cell.backgroundColor = UIColor.clearColor()
        cell.textLabel?.text = self.texts[indexPath.row] as? String
        cell.imageView?.image = UIImage(named: (self.images[indexPath.row] as? String)!)
        return cell
    }
    //cell的高度
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 55
    }
    //MARK: - 点击左上角按钮
    func dianjiNavZuoshangjiao(){
         super.show()
    }
}

