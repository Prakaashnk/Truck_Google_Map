//
//  ResponseCode.swift
//  Trucks
//
//  Created by PrakashNK on 09/12/21.
//

import Foundation
struct ResponseCode : Codable {
	let responseCode : Int?
	let message : String?

	enum CodingKeys: String, CodingKey {

		case responseCode = "responseCode"
		case message = "message"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		responseCode = try values.decodeIfPresent(Int.self, forKey: .responseCode)
		message = try values.decodeIfPresent(String.self, forKey: .message)
	}

}
