//
//  Constant.swift
//  Sail Uday
//
//  Created by webwerks on 8/14/17.
//  Copyright © 2017 webwerks1. All rights reserved.
//

import Foundation
import UIKit

enum FilterType {
    case Initiatives
    case Activities
    
}
enum DashboardViewType {
    case Summary
    case MyInitiative
    
}
enum STATUS : String{
    case partial_delay = "PD"
    case completed = "C"
    case on_track = "OT"
    case significant_delay = "SD"
}

struct CommonStrings {
    static let appName = "Sail Uday"
    static let deviceType = "iOS"
    static let logoutMsg = "Are you sure you want to Logout?"
    static let validEmail = "Enter valid Email."
    static let validContact = "Enter valid contact number."
    static let validFirstName = "Enter valid first name."
    static let validLastName = "Enter valid Last name."
    static let validPassword = "Enter Valid Password"
    static let validNewPassword = "Enter Valid New Password"
    static let emptyFirstName = "Enter First Name."
    static let emptyLastName = "Enter Last Name."
    static let emptyPassword = "Enter Password."
    static let emptyNewPassword = "Enter New Password"
    static let emptyConfirmPassword = "Enter Confirm Password."
    static let emptyUsername = "Enter Username"
    static let emptyEmail = "Enter Email"
    static let emptyPhone = "Enter Mobile Number"
    static let emptyAddress = "Enter Address"
    static let passwordMismatch = "Passwords do not match."
    static let emptyZipcode = "Enter Zipcode"
    static let selectCity = "Select City"
    static let selectState = "Select State"
    static let selectCountry = "Select Country"
}
class Constant {
    static func showAlertWithMessage(message:String, presentingVC:UIViewController){
        let alertVC = UIAlertController(title: CommonStrings.appName, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default) { (action) in
        }
        alertVC.addAction(ok)
        presentingVC.present(alertVC, animated: true, completion: nil)
    }
}
