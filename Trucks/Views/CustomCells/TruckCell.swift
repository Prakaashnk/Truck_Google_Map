//
//  TruckCell.swift
//  Trucks
//
//  Created by PrakashNK on 08/12/21.
//

import UIKit

class TruckCell: UITableViewCell {

    @IBOutlet weak var truckImageView: UIImageView!
    @IBOutlet weak var truckNumberLabel: UILabel!
    @IBOutlet weak var timeUnitLabel: UILabel!
    @IBOutlet weak var truckLastTime: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var speedUnitLabel: UILabel!
    
    var viewModel: Truck? {
        didSet{
            bindViewModel()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    private func bindViewModel() {
        truckNumberLabel.text = viewModel?.truckNumber
        let speed = String(format:"%.2f", viewModel?.lastWaypoint?.speed ?? 0.0)
        speedLabel.text = speed
        let lastTime = viewModel?.lastWaypoint?.createTime?.secondsToTime()
        timeLabel.text = lastTime
        let unit = viewModel?.lastWaypoint?.createTime?.getUnit()
        timeUnitLabel.text = unit
        truckLastTime.text = getStartStopTime()
    }
    
    func getStartStopTime() -> String{
        let time = viewModel?.lastRunningState?.stopStartTime?.secondsToTime()
        let unit = viewModel?.lastRunningState?.stopStartTime?.getUnitOnly()
        let state = (viewModel?.lastRunningState?.truckRunningState == 1) ? "Running" : "Stopped"
        return "\(state) since last \(time ?? "") \(unit ?? "")"
    }
    
}
