//
//  LastRunningState.swift
//  Trucks
//
//  Created by iDesignA7 on 09/12/21.
//

import Foundation
struct LastRunningState : Codable {
	let truckId : Int?
	let stopStartTime : Int?
	let truckRunningState : Int?
	let lat : Double?
	let lng : Double?
	let stopNotficationSent : Int?

	enum CodingKeys: String, CodingKey {

		case truckId = "truckId"
		case stopStartTime = "stopStartTime"
		case truckRunningState = "truckRunningState"
		case lat = "lat"
		case lng = "lng"
		case stopNotficationSent = "stopNotficationSent"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		truckId = try values.decodeIfPresent(Int.self, forKey: .truckId)
		stopStartTime = try values.decodeIfPresent(Int.self, forKey: .stopStartTime)
		truckRunningState = try values.decodeIfPresent(Int.self, forKey: .truckRunningState)
		lat = try values.decodeIfPresent(Double.self, forKey: .lat)
		lng = try values.decodeIfPresent(Double.self, forKey: .lng)
		stopNotficationSent = try values.decodeIfPresent(Int.self, forKey: .stopNotficationSent)
	}

}
