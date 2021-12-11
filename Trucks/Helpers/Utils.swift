//
//  Utils.swift
//  Trucks
//
//  Created by PrakashNK on 09/12/21.
//

import UIKit

import UIKit

extension UIViewController {

    func presentAlertWithTitle(title: String, message: String, options: String..., completion: @escaping (Int) -> Void) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for (index, option) in options.enumerated() {
            alertController.addAction(UIAlertAction.init(title: option, style: .default, handler: { (action) in
                completion(index)
            }))
        }
        self.present(alertController, animated: true, completion: nil)
    }
}

func getCurrentMillis()->Int64{
    return  Int64(NSDate().timeIntervalSince1970 * 1000)
}


func getTruckcolor(truck: Truck) -> UIColor {
    var color: UIColor = .red
    if truck.lastRunningState?.truckRunningState == 1 {
        color = .systemGreen
    }
    else if truck.lastRunningState?.truckRunningState == 0,  let ignitionOn = truck.lastWaypoint?.ignitionOn, ignitionOn == false {
        color = .blue
    }
    else if truck.lastRunningState?.truckRunningState == 0,  let _ = truck.lastWaypoint?.ignitionOn {
        color = .yellow
    }
    return color
}
