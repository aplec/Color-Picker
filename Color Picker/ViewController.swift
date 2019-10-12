//
//  ViewController.swift
//  Color Picker
//
//  Created by Ante Plecas on 10/11/19.
//  Copyright © 2019 Ante Plecas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    struct Color{
        var color: String
        var colorCode: UIColor
    }
    
    var colorArray: [Color] = [Color(color:"Red", colorCode: UIColor.red), Color(color:"Orange", colorCode: UIColor.orange), Color(color:"Yellow", colorCode: UIColor.yellow), Color(color:"Green", colorCode: UIColor.green), Color(color:"Blue", colorCode: UIColor.blue), Color(color:"Purple", colorCode: UIColor.purple)]
    
    var initialIndex: Int = 0
    
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var colorPickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorPickerView.dataSource = self
        colorPickerView.delegate = self
        
        colorPickerView.selectRow(initialIndex, inComponent: 0, animated: true)
        detailLabel.text = colorArray[initialIndex].color
        view.backgroundColor = colorArray[initialIndex].colorCode
    }
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return colorArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        detailLabel.text = colorArray[row].color
        view.backgroundColor = colorArray[row].colorCode
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return colorArray[row].color
    }
    

}


