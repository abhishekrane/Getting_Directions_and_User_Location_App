//
//  ThirdViewController.swift
//  Assignment4
//
//  Created by Abhishek rane on 10/21/17.
//  Copyright © 2017 Abhishek rane. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController,UITextViewDelegate {
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var thirdview: UIView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var segment: UISegmentedControl!
    
    
    //controlling segment Tab
    @IBAction func segmentSelected(_ sender: UISegmentedControl) {
   
        switch sender.selectedSegmentIndex {
        case 0:
            UIView.animate(withDuration:0.5, animations:{
                                self.firstView.alpha = 1.0;
                                self.secondView.alpha = 0.0;
                self.thirdview.alpha = 0.0;}) ; break
        case 1:
        UIView.animate(withDuration:0.5, animations: {
                                self.firstView.alpha = 0.0;
                                self.secondView.alpha = 1.0;
            self.thirdview.alpha = 0.0;}) ;break
        case 2:
                UIView.animate(withDuration:0.5, animations: {
                self.firstView.alpha = 0.0;
                self.secondView.alpha = 0.0;
                self.thirdview.alpha = 1.0;
                });
            
            
            
        default:
            UIView.animate(withDuration:0.5, animations:{
                self.firstView.alpha = 1.0;
                self.secondView.alpha = 0.0;
                self.thirdview.alpha = 0.0;})
        }
 
    }
  
   
    // switch  and activity control
    @IBAction func `switch`(_ sender: UISwitch) {
        
        if sender.isOn == true{
            activityIndicator.startAnimating()
        label.text = "Loading"
    }
        else {
            activityIndicator.stopAnimating()
           
            label.text = "  Stop"}
    }
    
    
    // getting alerts
    @IBAction func button(_ sender: Any) {
        
        let alert = UIAlertController( title: "alert" , message: "Do You Like Iphone", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "NO", style: UIAlertActionStyle.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "Yes", style: UIAlertActionStyle.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert,animated: true,completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
                // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Dismissing Keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with:event)

        self.view.endEditing(true)
    }
  
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


