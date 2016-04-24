//
//  ViewController.swift
//  AnimationBlock
//
//  Created by 黄海燕 on 16/4/24.
//  Copyright © 2016年 huanghy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let rect = CGRectMake(50, 50, 200, 200)
        let imageView = UIImageView(frame:rect)
        let image = UIImage(named: "1.jpg")
        
        imageView.image = image
        //设置图像的标识值，以便后期对图像视图的调用
        imageView.tag = 1
        self.view.addSubview(imageView)
        //初始化一个按钮对象，当点击按钮是开始播放动画
        let button = UIButton(type:UIButtonType.System)
        button.frame = CGRectMake(50, 400, 220, 44)
        button.backgroundColor = UIColor.lightGrayColor()
        button.setTitle("tap", forState: UIControlState.Normal)
        //给按钮对象，绑定点击事件
        button.addTarget(self, action: "playAnimation", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button)
        
    }

    //创建一个方法，来响应按钮的点击事件
    func playAnimation(){
        //发出开始视图动画的请求，标志着视图动画块的开始。在它和提交动画请求之间，可以定义动画的各种展现方式
        UIView.beginAnimations(nil, context: nil)
        //设置动画的播放速度为淡入淡出
        UIView.setAnimationCurve(.EaseInOut)
        //设置动画的时长为5秒
        UIView.setAnimationDuration(5)
        //设置动画从视图当前状态开始播放
        UIView.setAnimationBeginsFromCurrentState(true)
        //接着通过标识值，找到之前创建的图像视图，作为动画的载体
        let view = self.view.viewWithTag(1)
        //设置动画类型为翻转动画
        UIView.setAnimationTransition(.FlipFromRight, forView: view!, cache: true)
        //调用视图的提交动画方法，表示着动画块的结束
        UIView.commitAnimations()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

