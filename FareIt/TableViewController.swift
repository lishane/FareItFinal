//
//  TableViewController.swift
//  FareIt
//
//  Created by Shane on 10/18/15.
//  Copyright © 2015 FareIt. All rights reserved.
//
import UIKit
import Foundation

class TableViewController {

     @IBOutlet var tableView: UITableView!
    
    @objc func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("BusinessTableViewCell") as! BusinessTableViewCell
        
        let business = self.results[indexPath.row]
        
        if (business.imageURL != nil) {
            cell.previewImage.setImageWithURL(business.imageURL)
        }
        
        cell.previewImage.layer.cornerRadius = 9.0
        cell.previewImage.layer.masksToBounds = true
        
        cell.nameLabel.text = "\(indexPath.row + 1). \(business.name)"
        cell.ratingImage.setImageWithURL(business.ratingImageURL)
        
        let reviewCount = business.reviewCount
        if (reviewCount == 1) {
            cell.reviewLabel.text = "\(reviewCount) review"
        } else {
            cell.reviewLabel.text = "\(reviewCount) reviews"
        }
        
        cell.addressLabel.text = business.shortAddress
        cell.categoriesLabel.text = business.displayCategories
        
        let distance = business.location.distanceFromLocation(self.userLocation.location)
        cell.distanceLabel.text = String(format: "%.1f mi", distance / 1609.344)
        cell.distanceLabel.sizeToFit()
        
        cell.dealsImage.hidden = business.deals == nil
        
        cell.layoutIfNeeded()
        
        return cell
    }
   
}

class BusinessTableViewCell: UITableViewCell {
    
    @IBOutlet weak var previewImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var ratingImage: UIImageView!
    @IBOutlet weak var reviewLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var categoriesLabel: UILabel!
    @IBOutlet weak var dealsImage: UIImageView!
    
}