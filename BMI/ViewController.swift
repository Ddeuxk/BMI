//
//  ViewController.swift
//  BMI
//
//  Created by Dunk on 6/12/2566 BE.
//

import UIKit

class ViewController: UIViewController {
    var wnum:Float=25
    var hnum:Float=100
    @IBOutlet weak var slideh: UISlider!
    @IBOutlet weak var slidew: UISlider!
    @IBOutlet weak var switchMetric: UISwitch!
    @IBOutlet weak var result: UITextField!
    @IBOutlet weak var bmi: UITextField!
    @IBAction func btn(_ sender: Any) {
        calc()
        if switchMetric.isOn{
            kg.text="pound."
            cm.text="inch."
            txtw.text = String(format: "%.2f", wnum * 2.20462)
            txth.text = String(format: "%.2f", hnum * 0.393701)
        }
        else{
            kg.text="kg."
            cm.text="cm."
            txtw.text = String(wnum)
            txth.text = String(hnum)
        }
        calc()
    }
    @IBOutlet weak var cm: UILabel!
    @IBOutlet weak var kg: UILabel!
    @IBOutlet weak var txth: UITextField!
    @IBOutlet weak var txtw: UITextField!
    @IBAction func sliderh(_ sender: UISlider) {
        hnum=sender.value
        calc()
        if switchMetric.isOn{
            txth.text=String(format: "%.2f", hnum * 0.393701)
        }
        else{
            txth.text=Int(sender.value).description
        }
    }
    @IBAction func sliderw(_ sender: UISlider) {
        wnum=sender.value
        calc()
        if switchMetric.isOn{
            txtw.text=String(format: "%.2f", wnum * 2.20462)
        }
        else{
            txtw.text=Int(sender.value).description
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.bmi.isEnabled=false
        self.result.isEnabled=false
        
    }
    func calc() {
        if let weightText = txtw.text, let heightText = txth.text {
            if let weight = Float(weightText), let height = Float(heightText) {
                var bmiValue: Float
                if switchMetric.isOn {
                    bmiValue = (weight * 703) / (height * height)
                }else{
                    bmiValue = weight / ((height / 100) * (height / 100))
                    }

                bmi.text = String(format: "%.2f", bmiValue)
                    
                var bmiCategory = ""
                if bmiValue < 18.5 {
                    bmiCategory = "Underweight"
                } else if bmiValue >= 18.5 && bmiValue <= 24.9 {
                    bmiCategory = "Normal or Healthy Weight"
                } else if bmiValue >= 25.0 && bmiValue <= 29.9 {
                    bmiCategory = "Overweight"
                } else {
                    bmiCategory = "Obese"
                }
                result.text = bmiCategory
                }
        }
    }
}

