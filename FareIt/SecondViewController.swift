//
//  SecondViewController.swift
//  FareIt
//
//  Created by Richard Ju on 10/17/15.
//  Copyright © 2015 FareIt. All rights reserved.

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var minStarFour: UIButton!
    @IBOutlet weak var minStarThree: UIButton!
    @IBOutlet weak var minStarTwo: UIButton!
    @IBOutlet weak var styFastFood: UIButton!
    @IBOutlet weak var styDineIn: UIButton!
    @IBOutlet weak var gfAlcohol: UIButton!
    @IBOutlet weak var gfGroups: UIButton!
    @IBOutlet weak var gfKids: UIButton!
    @IBOutlet weak var priceFour: UIButton!
    @IBOutlet weak var priceThree: UIButton!
    @IBOutlet weak var priceTwo: UIButton!
    @IBOutlet weak var priceOne: UIButton!
    @IBOutlet weak var commonDistanceGroup: UIView!
    @IBOutlet weak var apply: UIButton!
    var prefMaxDist = 0
    //    var listBusinesses: Array<Business> =[]
    //    var listBusinesses: [Business] = []
    var businesses: [YelpBusiness] = []
    let businessArray = YelpModel.sharedInstance
    var minRating = 1
    var kidsSelected: Bool = false
    var relaxedSelected: Bool = false
    var liquorSelected: Bool = false
    let kidsParam = " kids"
    let relaxed = " relaxed"
    let liquor = " alcohol"
    let cheap = " cheap"
    let expensive = " expensive"
    var cheapSelected = false
    var expensiveSelected = false
    let dineIn = " dine in"
    var fastFood = " fast Food"
    var dineInSelected = false
    var fastFoodSelected = false
    
    var term = "food"
    
    @IBAction func bikeSelected(sender: UIButton) {
        distancePref.text = "5 mi"
        distancePrefAdjuster.value = 5
        prefMaxDist = 5
        
    }
    @IBAction func driveSelected(sender: UIButton) {
        distancePref.text = "15 mi"
        distancePrefAdjuster.value = 15
        prefMaxDist = 15
        
    }
    @IBAction func walkSelected(sender: UIButton) {
        distancePref.text = "1 mi"
        distancePrefAdjuster.value = 1
        prefMaxDist = 1
        
    }
    
    @IBOutlet weak var BikeDistance: UIButton!
    @IBOutlet weak var DriveDistance: UIButton!
    @IBOutlet weak var walkDistance: UIButton!
    
    @IBAction func distPrefValChanged(sender: UIStepper) {
        
        distancePref.text = Int(sender.value).description + " mi"
        prefMaxDist = Int(sender.value)
        getBusinessList()
    }
    
    @IBOutlet weak var distancePref: UITextField!
    @IBOutlet weak var distancePrefAdjuster: UIStepper!
    
    
    func getBusinessList() {
        let yp = YelpModel.sharedInstance
        yp.search(term, done: {
            (businesses: [YelpBusiness], error: NSError?) in
            self.businesses = businesses
        })
        
    }
    
    
    @IBAction func search() {
        
        if kidsSelected {
            term += kidsParam
        }
        if relaxedSelected {
            term += relaxed
        }
        if liquorSelected {
            term += liquor
        }
        if cheapSelected {
            term += cheap
        }
        if expensiveSelected {
            term += expensive
        }
        if dineInSelected {
            term += dineIn
        }
        if fastFoodSelected {
            term += fastFood
        }
        getBusinessList()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        distancePrefAdjuster.wraps = true
        distancePrefAdjuster.autorepeat = true
        distancePrefAdjuster.maximumValue = 25
        distancePrefAdjuster.minimumValue = 1
        distancePrefAdjuster.layer.cornerRadius = 5
        

        walkDistance.layer.cornerRadius = 10
        DriveDistance.layer.cornerRadius = 10
        BikeDistance.layer.cornerRadius = 10
        priceOne.layer.cornerRadius = 10
        priceTwo.layer.cornerRadius = 10
        priceThree.layer.cornerRadius = 10
        priceFour.layer.cornerRadius = 10
        apply.layer.cornerRadius = 10
        
        styDineIn.layer.cornerRadius = 10
        styFastFood.layer.cornerRadius = 10
        

        
        minStarTwo.layer.cornerRadius = 5
        minStarThree.layer.cornerRadius = 5
        minStarFour.layer.cornerRadius = 5
        
        apply.layer.cornerRadius = 5
        
        //        var button:UIButton = UIButton.buttonWithType(UIButtonType.System) as UIButton
        //
        //        button.setTitle("", forState: UIControlState.Normal)
        //        button.frame = CGRectMake(0, 0, 100, 44)
        //
        //        self.view.addSubview(button as UIView)
        //
        //        button.setImage(normalImage, forState: UIControlState.Selected)
        //
        //        button.setImage(selectedImage, forState: UIControlState.Selected)
        //
        //        button.addTarget(self, action: "buttonClicked:", forControlEvents: UIControlEvents.TouchUpInside)
        
    }
    
    //    func buttonClicked(sender: UIButton) {
    //
    //        sender.selected = !sender.selected;
    //    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet var ratingGroup: [UIButton]!
    @IBAction func ratingGroupClicked(sender: AnyObject) {
        
        unhighlightGroup(ratingGroup)
        highlight(sender as! UIButton)
        if sender as! UIButton == minStarTwo {
            minRating = 2
        }
        if sender as! UIButton == minStarThree {
            minRating = 3
        }
        if sender as! UIButton == minStarFour {
            minRating = 4
        }
    }
    
    @IBOutlet var priceGroup: [UIButton]!
    @IBAction func priceGroupClicked(sender: AnyObject) {
        if sender as! UIButton == priceTwo {
            cheapSelected = true
        }
        if sender as! UIButton == priceFour {
            expensiveSelected = true
        }
        unhighlightGroup(priceGroup)
        highlight(sender as! UIButton)
    }
    
    
    
    @IBAction func soloButtonClicked(sender: UIButton) {
        if sender == styDineIn {
            dineInSelected = true
        }
        if sender == gfGroups {
            relaxedSelected = true
        }
        if sender == gfKids {
            kidsSelected = true
        }
        if sender == gfAlcohol {
            liquorSelected = true
        }
        if sender == styFastFood {
            fastFoodSelected = true
        }
        if sender == styDineIn {
            dineInSelected = true
        }
        
        if (sender.selected == false) {
            highlight(sender)
        } else {
            unhighlightButton(sender)
        }
        
        
    }
    
    func unhighlightGroup( a: [UIButton]!) {
        for button in a {
            button.selected = false
        }
    }
    
    func highlight(button: UIButton) {
        button.selected = true
    }
    
    func unhighlightButton( a: UIButton) {
        a.selected = false
    }
    
    func getBusiness() -> [YelpBusiness] {
        return businesses
    }
    
}





