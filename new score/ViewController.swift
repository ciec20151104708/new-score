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
var c : Int = 0

var flagA : Int=0
var flagB : Int=0
var dlg : Int = 0
class ViewController: UIViewController, UIImagePickerControllerDelegate,
    UINavigationControllerDelegate{

    @IBOutlet weak var pingpang: UIImageView!
    @IBOutlet weak var Aimg: UIImageView!
    @IBOutlet weak var Bimg: UIImageView!
    @IBOutlet weak var Aimage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func Aput(_ sender: UIButton) {
        if dlg==0{
            flagA=1
            flagB=0
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
                let picker = UIImagePickerController()
                picker.delegate = self
                picker.sourceType = UIImagePickerControllerSourceType.photoLibrary
                self.present(picker, animated: true, completion: {
                    () -> Void in
                })
            }else{
                print("读取相册错误")
            }
        }
      }
    @IBAction func Bput(_ sender: UIButton) {
        if dlg==0{
            flagB=1
            flagA=0
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
                let picker = UIImagePickerController()
                picker.delegate = self
                picker.sourceType = UIImagePickerControllerSourceType.photoLibrary
                self.present(picker, animated: true, completion: {
                    () -> Void in
                })
            }else{
                print("读取相册错误")
            }
        }
        
    }
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : Any]) {
        print(info)
        let image:UIImage!
        image = info[UIImagePickerControllerOriginalImage] as! UIImage
        if(flagA==1){
            Aimg.image = image
        }
        else if(flagB==1){
            Bimg.image = image
        }
        picker.dismiss(animated: true, completion: {
            () -> Void in
        })
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
    @IBOutlet weak var M: UITextField!

    
    @IBAction func start(_ sender: Any) {
        x = 0
        y = 0
        A.text = "\(x)"
        B.text = "\(y)"
    }
    @IBAction func Aadd(_ sender: UIButton) {
        x = x + 1
        c = c + 1
        A.text = "\(x)"
        if c<2{
            M.text = "A发球"
        }else if c>2{
            c = 0
            M.text = "B发球"
        }
        if x >= 10 && y >= 10{
            if x >= y + 2{
                X.text = "A选手获胜"
                i = i + 1
                n = n + 1
                A.text = "\(11)"
                
            }
        }else if  x > y && x == 11 {
            
            X.text = "A选手获胜"
            if X.text != "A选手获胜" {
                x = 0
            }
            i = i + 1
            n = n + 1
    }
    
    }
    @IBAction func Badd(_ sender: UIButton) {
        y = y + 1
        if c<2{
            M.text = "B发球"
        }else if c>=2{
            c = 0
            M.text = "A发球"
        }
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
        if x<0{
            A.text = "\(0)"
        }
    }
    @IBAction func Bback(_ sender: UIButton) {
        B.text = "\(y)"
        y = y - 1
        B.text = "\(y)"
        if y<0{
            B.text = "\(0)"
        }
    }
    @IBAction func end(_ sender: Any) {
        x = 0
        y = 0
        c = 0
        A.text = "\(x)"
        B.text = "\(y)"
        X.text = ""
        M.text = ""
        if i >= j{
            Y.text = "\(n)"
            Z.text = " VS "
            N.text = "\(m)"
        }else if j >= i{
            Y.text = "\(n)"
            Z.text = " VS "
            N.text = "\(m)"
        }
        
    }
}
