//
//  TrucksListViewModel.swift
//  Trucks
//
//  Created by PrakashNK on 08/12/21.
//

import UIKit
import RxSwift
import Alamofire

class TrucksListViewModel: NSObject {
    
    var allTrucks: [Truck]! = []
    var filteredTrucks: [Truck]! = []
    var items = PublishSubject<[Truck]>()
    
    public func getTrucks() {
        if let getTruckAPIUrl = API.getTrucks.urlString {
            let request = AF.request(getTruckAPIUrl)
            request.responseDecodable(of: TrucksResponse.self) { (response) in
              guard let trucksResponse = response.value else { return }
                if trucksResponse.responseCode?.responseCode == 200 {
                    if let data = trucksResponse.data {
                        self.allTrucks = data
                        self.filteredTrucks = data
                        self.items.onNext(data)
                    }
                }
            }
        }
    }
    
    func getTrucksBySearch(searchString: String) {
        if searchString == "" {
            self.filteredTrucks = self.allTrucks
        }
        else {
            self.filteredTrucks = self.allTrucks.filter({
                $0.truckNumber?.range(of: searchString, options: .caseInsensitive) != nil
            })
        }
        self.items.onNext(self.filteredTrucks)
    }
}
