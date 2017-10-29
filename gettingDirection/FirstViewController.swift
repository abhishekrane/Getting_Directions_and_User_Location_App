//
//  FirstViewController.swift
//  Assignment4
//
//  Created by Abhishek rane on 10/21/17.
//  Copyright © 2017 Abhishek rane. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController,UIPickerViewDataSource, UIPickerViewDelegate {
    
    var countryAndSports: Dictionary<String, Array<String>>?
    var country:Array<String>?
    var selected:String?
    var sports:Array<String>?
    var multipler : Float = 1.43;
    @IBOutlet weak var Picker: UIPickerView!
    @IBOutlet weak var slider: UISlider!
  
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        guard (country != nil) && sports != nil else { return 0 }
        switch component {
        case 0: return country!.count
        case 1: return sports!.count
        default: return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        guard (country != nil) && sports != nil else { return "None" }
        switch component {
        case 0: return country![row]
        case 1: return sports![row]
        default: return "None"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        guard (country != nil) && sports != nil else { return }
        if component == 0 && row == 0{
            selected = country![row]
            sports = countryAndSports![selected!]!.sorted()
            pickerView.reloadComponent(1)
            multipler = 1.43 ;
            print("picked component \(component) row \(row)")
        }
        if component == 0 && row == 1{
            selected = country![row]
            sports = countryAndSports![selected!]!.sorted()
            pickerView.reloadComponent(1)
            multipler = 2 ;
            print("picked component \(component) row \(row)")
        }
        if component == 0 && row == 2{
            selected = country![row]
            sports = countryAndSports![selected!]!.sorted()
            pickerView.reloadComponent(1)
            multipler = 1.67
            print("picked component \(component) row \(row)")
        }
        if component == 1 {
            selected = sports![row]
            print("picked component \(component) row \(row)")
            slider.value = Float(row) * multipler
        }
        
        
     }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Picker!.delegate = self
        Picker!.dataSource = self
    
        let data:Bundle = Bundle.main
        let countryPlist:String? = data.path(forResource: "List", ofType: "plist")
        if countryPlist != nil {
            countryAndSports = (NSDictionary.init(contentsOfFile: countryPlist!) as! Dictionary)
            country = countryAndSports?.keys.sorted()
            selected = country![0]
            sports = countryAndSports![selected!]!.sorted()
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

