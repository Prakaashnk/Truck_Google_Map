//
//  API.swift
//  Trucks
//
//  Created by PrakashNK on 08/12/21.
//

import Foundation

public enum API {
    case getTrucks
    var urlString: URL? {
        switch self {
        case .getTrucks:
            let baseURL: String = BundleValues.sharedInstance.APIBaseURL() as String
            let apiName = "/logistics/searchTrucks?auth-company=PCH&companyId=33&deactivated=false&key=g2qb5jvucg7j8skpu5q7ria0mu&q-expand=true&q-include=lastRunningState,lastWaypoint"
            return URL.init(string: baseURL+apiName)
        }
    }
}
