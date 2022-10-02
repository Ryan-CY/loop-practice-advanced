//
//  ViewController.swift
//  loop practice-advanced
//
//  Created by Ryan Lin on 2022/9/29.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var shapeSegmentedControl: UISegmentedControl!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var patternLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func numberChangeSlider(_ sender: UISlider) {
        //設定patternLabel的字體大小是32
        patternLabel.font = patternLabel.font.withSize(32)
        sender.value = sender.value.rounded()
        let number = Int(sender.value)
        numberLabel.text = String(number)
        
        var content = ""
        if shapeSegmentedControl.selectedSegmentIndex==0{
            for i in 1...number{
                for _ in 1...i{
                    content += "🍳"
                }
                content += "\n"
            }
        }
        else if shapeSegmentedControl.selectedSegmentIndex==1{
            for i in 1...number{
                for _ in i...number{
                    content += "🍭"
                }
                content += "\n"
            }
        }
        else if shapeSegmentedControl.selectedSegmentIndex==2{
            for i in 1...number{
                for j in 1...number{
                    if j > i {
                        content += "🍭"
                    }
                    else if j == i{
                        content += "🍫"
                    }
                    else {
                        content += "🧊"
                    }
                }
                content += "\n"
            }
            
        }
        else if shapeSegmentedControl.selectedSegmentIndex==3{
            //縮小patternLabel的字體大小到20，不然超過Label的範圍將無法顯示
            patternLabel.font = patternLabel.font.withSize(20)
            /*也可以這樣寫:
             patternLabel.font = UIFont(name: patternLabel.font.fontName, size: 20)*/
            var count = 1
            for i in 1...number*2-1{
                //讓第二層範圍跟著count做改變
                for _ in 1...count{
                    content += "🧊"
                }
                if i < number{
                    count += 1
                }
                else{
                    count -= 1
                }
                content += "\n"
            }
        }
        else if shapeSegmentedControl.selectedSegmentIndex==4{
           let emojis = ["☀️","🌈","💦","🫧","🐳"]
            for i in 1...number{
                for _ in 1...i{
                    content += emojis[i-1]
                }
                content += "\n"
              }
            }
        else if shapeSegmentedControl.selectedSegmentIndex==5{
            patternLabel.font = patternLabel.font.withSize(24)
            for i in 1...number{
                for _ in i..<number{
                    content += "🦞"
                }
                let number = i * 2 - 1
                for _ in 1...number{
                    content += "🍳"
                }
                content += "\n"
            }
        }
            patternLabel.text = content
        }
    }
