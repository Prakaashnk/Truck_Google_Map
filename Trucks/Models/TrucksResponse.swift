//
//  TrucksResponse.swift
//  Trucks
//
//  Created by iDesignA7 on 09/12/21.
//

import Foundation
struct TrucksResponse : Codable {
	let responseCode : ResponseCode?
	let data : [Truck]?

	enum CodingKeys: String, CodingKey {

		case responseCode = "responseCode"
		case data = "data"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		responseCode = try values.decodeIfPresent(ResponseCode.self, forKey: .responseCode)
		data = try values.decodeIfPresent([Truck].self, forKey: .data)
	}

}
