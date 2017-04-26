//
//  ViewController.swift
//  new score
//
//  Created by s20151104708 on 17/4/24.
//  Copyright © 2017年 s20151104708. All rights reserved.
//

import UIKit
var x : Int = 0
var y : Int = 0
var n : Int = 0
var m : Int = 0
var i : Int = 0
var j : Int = 0
var flagA : Int=0
class ViewController: UIViewController, UIImagePickerControllerDelegate,
    UINavigationControllerDelegate{

    @IBOutlet weak var pingpang: UIImageView!
    @IBOutlet weak var Aimg: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func Aput(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
        //初始化图片控制器
        let picker = UIImagePickerController()
        //设置代理
        picker.delegate = self
        //指定图片控制器类型
        picker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        //弹出控制器，显示界面
        self.present(picker, animated: true, completion: {
            () -> Void in
        })
     }else{
    print("读取相册错误")
      }
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : Any]) {
        //查看info对象
        print(info)
        //显示的图片
        let image:UIImage!
        //获取选择的原图
        image = info[UIImagePickerControllerOriginalImage] as! UIImage
        if(flagA==1){Aimg.image = image}
        picker.dismiss(animated: true, completion: {
            () -> Void in
        })
    }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBOutlet weak var A: UITextField!
    @IBOutlet weak var B: UITextField!
    @IBOutlet weak var X: UITextField!

    @IBOutlet weak var Y: UITextField!
    @IBOutlet weak var Z: UITextField!
    @IBOutlet weak var N: UITextField!

    
    @IBAction func start(_ sender: Any) {
        x = 0
        y = 0
        A.text = "\(x)"
        B.text = "\(y)"
    }
    @IBAction func Aadd(_ sender: UIButton) {
        x = x + 1
        A.text = "\(x)"
        if x >= 10 && y >= 10{
            if x >= y + 2{
                X.text = "A选手获胜"
                i = i + 1
                n = n + 1
            }
        }else if  x > y && x == 11 {
            X.text = "A选手获胜"
            i = i + 1
            n = n + 1
            
    }
    }
    @IBAction func Badd(_ sender: UIButton) {
        y = y + 1
        B.text = "\(y)"
        if x >= 10 && y >= 10{
            if y >= x + 2{
                X.text = "B选手获胜"
                j = j + 1
                m = m + 1
            }
        }else if  y > x && y == 11 {
            X.text = "B选手获胜"
            j = j + 1
            m = m + 1
            
        }
    }
    @IBAction func Aback(_ sender: UIButton) {
        A.text = "\(x)"
        x = x - 1
        A.text = "\(x)"
    }
    @IBAction func Bback(_ sender: UIButton) {
        B.text = "\(y)"
        y = y - 1
        B.text = "\(y)"
    }
    @IBAction func end(_ sender: Any) {
        x = 0
        y = 0
        A.text = "\(x)"
        B.text = "\(y)"
        X.text = ""
}
}
