//
//  ViewController.swift
//  TipCalculator
//
//  Created by Casey Kim on 2022/07/29.
//

import UIKit

class ViewController:UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return PICKER_VIEW_COLUMN
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return splitType.count
    }
    
    internal func pickerView(_ pickerview: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return splitType[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        SplitLabel.text = splitType[row]
    }
    
    
    let MAX_ARRAY_NUM = 10
    let PICKER_VIEW_COLUMN = 1
    var splitType = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30"]
    

@IBOutlet weak var TipLabel: UILabel!
    @IBOutlet weak var BillBeforeTip: UITextField!
    @IBOutlet weak var TipSlider: UISlider!
    @IBOutlet weak var SplitLabel: UILabel!
    @IBOutlet weak var SplitPicker: UIPickerView!
    @IBOutlet weak var CalculateButton: UIButton!
    @IBOutlet weak var TipAmount: UILabel!
    @IBOutlet weak var TotalAmount: UILabel!
    @IBOutlet weak var AmountEach: UILabel!
    
    @IBOutlet weak var TipPercentageLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        BillBeforeTip.becomeFirstResponder()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)}
    
    func calculateBill() {
        let tipPercent = Int(TipSlider.value)
        guard let billAmount = Double(BillBeforeTip.text!)
        else { return }
        
        var tipTotal = billAmount * Double(tipPercent) / 100
        var billTotal = billAmount + tipTotal
        
        guard let splitNum = Double(SplitLabel.text!)
        else { return }
        var amountEach = billTotal / splitNum
        
        TipAmount.text = String(format: "Tip: $%.2f", tipTotal)
        TotalAmount.text = String(format: "Total: $%.2f", billTotal)
        AmountEach.text = String(format: "$%.2f EACH", amountEach)
    }
    
    
    
    @IBAction func TipSliderValueChanged(_ sender: Any) {
        TipPercentageLabel.text = String(format: "%2d%%", Int(TipSlider.value))
    }

    @IBAction func CalculateButton(_ sender: UIButton) {
        calculateBill()

    }
}
