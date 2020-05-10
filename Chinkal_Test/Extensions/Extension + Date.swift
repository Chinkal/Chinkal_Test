//
//  Extension + Date.swift
//  Chinkal_Test
//
//  Created by chinkalshah on 09/05/20.
//  Copyright © 2020 chinkalshah. All rights reserved.
//

import UIKit
import Foundation

extension Date{
    func CalculateTimeDiff(current: Date, recent : Date) -> String{
        let days = Calendar.current.dateComponents([.day], from: current, to: recent).day
        let months = Calendar.current.dateComponents([.month], from: current, to: recent).month
        let hours = Calendar.current.dateComponents([.hour], from: current, to: recent).hour
        let minutes = Calendar.current.dateComponents([.minute], from: current, to: recent).minute
        let seconds = Calendar.current.dateComponents([.second], from: current, to: recent).second
        let years = Calendar.current.dateComponents([.year], from: current, to: recent).year

        var diff = "Seconds"
        if(minutes! == 0 && seconds! < 60){
            diff = String(format: "%d%@", seconds!,"Seconds")
        }else if (minutes! < 60 && hours! == 0){
            diff = String(format: "%d%@", minutes!,"Minutes")
        }else if (hours! < 60 && days! == 0){
            diff = String(format: "%d%@", hours!,"Hours")
        }else if (days! <= 31 && months! == 0){
            diff = String(format: "%d%@", days!,"Days")
        }else if (months! <= 12 && years! == 0){
            diff = String(format: "%d%@", months!,"Months")
        }else{
            diff = String(format: "%d%@", years!,"Years")
        }
        return diff
    }
    
    
}


extension Double {
    func formatUsingAbbrevation () -> String {
        let numFormatter = NumberFormatter()

        typealias Abbrevation = (threshold:Double, divisor:Double, suffix:String)
        let abbreviations:[Abbrevation] = [(0, 1, ""),
                                           (1000.0, 1000.0, "K"),
                                           (100_000.0, 1_000_000.0, "M"),
                                           (100_000_000.0, 1_000_000_000.0, "B")]
                                           // you can add more !

        let startValue = Double (abs(self))
        let abbreviation:Abbrevation = {
            var prevAbbreviation = abbreviations[0]
            for tmpAbbreviation in abbreviations {
                if (startValue < tmpAbbreviation.threshold) {
                    break
                }
                prevAbbreviation = tmpAbbreviation
            }
            return prevAbbreviation
        } ()

        let value = Double(self) / abbreviation.divisor
        numFormatter.positiveSuffix = abbreviation.suffix
        numFormatter.negativeSuffix = abbreviation.suffix
        numFormatter.allowsFloats = true
        numFormatter.minimumIntegerDigits = 1
        numFormatter.minimumFractionDigits = 0
        numFormatter.maximumFractionDigits = 1

        return numFormatter.string(from: NSNumber (value:value))!
    }

}

extension UIViewController{
    
    func showNavbarItem() -> UIBarButtonItem{
        let spinner = UIActivityIndicatorView(style: .medium)
        spinner.color = .black
        spinner.startAnimating()
        
        let barItem = UIBarButtonItem(customView: spinner)
        return barItem
    }
    
}
