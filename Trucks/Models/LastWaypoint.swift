//
//  LastWaypoint.swift
//  Trucks
//
//  Created by PrakashNK on 09/12/21.
//

import Foundation
struct LastWaypoint : Codable {
	let id : Int?
	let lat : Double?
	let lng : Double?
	let createTime : Int?
	let accuracy : Double?
	let bearing : Double?
	let truckId : Int?
	let speed : Double?
	let updateTime : Int?
	let ignitionOn : Bool?
	let odometerReading : Double?
	let batteryPower : Bool?
	let fuelLevel : Int?
	let batteryLevel : Int?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case lat = "lat"
		case lng = "lng"
		case createTime = "createTime"
		case accuracy = "accuracy"
		case bearing = "bearing"
		case truckId = "truckId"
		case speed = "speed"
		case updateTime = "updateTime"
		case ignitionOn = "ignitionOn"
		case odometerReading = "odometerReading"
		case batteryPower = "batteryPower"
		case fuelLevel = "fuelLevel"
		case batteryLevel = "batteryLevel"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		lat = try values.decodeIfPresent(Double.self, forKey: .lat)
		lng = try values.decodeIfPresent(Double.self, forKey: .lng)
		createTime = try values.decodeIfPresent(Int.self, forKey: .createTime)
		accuracy = try values.decodeIfPresent(Double.self, forKey: .accuracy)
		bearing = try values.decodeIfPresent(Double.self, forKey: .bearing)
		truckId = try values.decodeIfPresent(Int.self, forKey: .truckId)
		speed = try values.decodeIfPresent(Double.self, forKey: .speed)
		updateTime = try values.decodeIfPresent(Int.self, forKey: .updateTime)
		ignitionOn = try values.decodeIfPresent(Bool.self, forKey: .ignitionOn)
		odometerReading = try values.decodeIfPresent(Double.self, forKey: .odometerReading)
		batteryPower = try values.decodeIfPresent(Bool.self, forKey: .batteryPower)
		fuelLevel = try values.decodeIfPresent(Int.self, forKey: .fuelLevel)
		batteryLevel = try values.decodeIfPresent(Int.self, forKey: .batteryLevel)
	}

}
