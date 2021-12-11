//
//  BundleValues.swift
//  Trucks
//
//  Created by PrakashNK on 08/12/21.
//

import UIKit

public class BundleValues: NSObject {
    public class var sharedInstance: BundleValues {
        struct Static {
            static var instance: BundleValues = BundleValues()
        }
        return Static.instance
    }
    
    func APIBaseURL() -> String {
        return Bundle.main.object(forInfoDictionaryKey:"APIBaseUrl") as! String
    }
}
