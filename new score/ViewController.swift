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
var k : Int = 0

var flagA : Int=0
var flagB : Int=0
var dlg : Int = 0
class ViewController: UIViewController, UIImagePickerControllerDelegate,
    UINavigationControllerDelegate{

    @IBOutlet weak var pingpang: UIImageView!
    @IBOutlet weak var Aimg: UIImageView!
    @IBOutlet weak var Bimg: UIImageView!
    
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

    @IBAction func addinfo(_ sender: Any) {

    }
    
    @IBAction func start(_ sender: Any) {
        x = 0
        y = 0
        A.text = "\(x)"
        B.text = "\(y)"
        Y.text = "0"
        Z.text = " VS "
        N.text = "0"
    }
    @IBAction func Aadd(_ sender: UIButton) {
        x = x + 1
        A.text = "\(x)"
        if x <= 10 && y<=10 {
        if( (x+y)%4==1 || (x+y)%4==2){
            M.text = "<- A发球"
        }else if((x+y)%4==3 || (x+y)%4==0){
            M.text = "B发球 ->"
        }
        }
        if x >= 10 && y >= 10{
            if x >= y + 2{
                if((x+y)%2==0){
                    M.text = "<- A发球"
                }else if((x+y)%2==1){
                    M.text = "B发球 ->"
                }
                A.text = "A获胜"
                i = i + 1
                A.text = A.text
            }
        }else if  x > y && x >= 11 {
            i = i + 1
            A.text = "A获胜"
            A.text = A.text
    }
    }
    @IBAction func Badd(_ sender: UIButton) {
        y = y + 1
        B.text = "\(y)"
        if x <= 10&&y<=10 {
        if (x+y)%4==1 || (x+y)%4==2{
            M.text = "<- A发球 "
        }else if(x+y)%4==3 || (x+y)%4==0{
            M.text = "B发球 ->"
            }
        }
        if x >= 10 && y >= 10{
            if y >= x + 2{
                if(x+y)%2==0{
                    M.text = "<- A发球 "
                }else if (x+y)%2==1{
                    M.text = "B发球 ->"
                }
                B.text = "B获胜"
                j = j + 1
                B.text = B.text
            }
        }else if  y > x && y >= 11 {
            j = j + 1
            B.text = "B获胜"
            B.text = B.text
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
            n = n + 1
            Y.text = "\(n)"
            Z.text = " VS "
            N.text = "\(m)"
  
        }else if j >= i{
            m = m + 1
            Y.text = "\(n)"
            Z.text = " VS "
            N.text = "\(m)"
        }
    }
}
