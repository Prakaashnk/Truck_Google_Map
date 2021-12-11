//
//  Truck.swift
//  Trucks
//
//  Created by iDesignA7 on 08/12/21.
//

import Foundation
struct Truck : Codable {
	let id : Int?
	let companyId : Int?
	let truckTypeId : Int?
	let truckSizeId : Int?
	let truckNumber : String?
	let transporterId : Int?
	let trackerType : Int?
	let imeiNumber : String?
	let simNumber : String?
	let name : String?
	let password : String?
	let createTime : Int?
	let deactivated : Bool?
	let breakdown : Bool?
	let lastWaypoint : LastWaypoint?
	let lastRunningState : LastRunningState?
	let durationInsideSite : Int?
	let fuelSensorInstalled : Bool?
	let externalTruck : Bool?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case companyId = "companyId"
		case truckTypeId = "truckTypeId"
		case truckSizeId = "truckSizeId"
		case truckNumber = "truckNumber"
		case transporterId = "transporterId"
		case trackerType = "trackerType"
		case imeiNumber = "imeiNumber"
		case simNumber = "simNumber"
		case name = "name"
		case password = "password"
		case createTime = "createTime"
		case deactivated = "deactivated"
		case breakdown = "breakdown"
		case lastWaypoint = "lastWaypoint"
		case lastRunningState = "lastRunningState"
		case durationInsideSite = "durationInsideSite"
		case fuelSensorInstalled = "fuelSensorInstalled"
		case externalTruck = "externalTruck"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		companyId = try values.decodeIfPresent(Int.self, forKey: .companyId)
		truckTypeId = try values.decodeIfPresent(Int.self, forKey: .truckTypeId)
		truckSizeId = try values.decodeIfPresent(Int.self, forKey: .truckSizeId)
		truckNumber = try values.decodeIfPresent(String.self, forKey: .truckNumber)
		transporterId = try values.decodeIfPresent(Int.self, forKey: .transporterId)
		trackerType = try values.decodeIfPresent(Int.self, forKey: .trackerType)
		imeiNumber = try values.decodeIfPresent(String.self, forKey: .imeiNumber)
		simNumber = try values.decodeIfPresent(String.self, forKey: .simNumber)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		password = try values.decodeIfPresent(String.self, forKey: .password)
		createTime = try values.decodeIfPresent(Int.self, forKey: .createTime)
		deactivated = try values.decodeIfPresent(Bool.self, forKey: .deactivated)
		breakdown = try values.decodeIfPresent(Bool.self, forKey: .breakdown)
		lastWaypoint = try values.decodeIfPresent(LastWaypoint.self, forKey: .lastWaypoint)
		lastRunningState = try values.decodeIfPresent(LastRunningState.self, forKey: .lastRunningState)
		durationInsideSite = try values.decodeIfPresent(Int.self, forKey: .durationInsideSite)
		fuelSensorInstalled = try values.decodeIfPresent(Bool.self, forKey: .fuelSensorInstalled)
		externalTruck = try values.decodeIfPresent(Bool.self, forKey: .externalTruck)
	}

}
