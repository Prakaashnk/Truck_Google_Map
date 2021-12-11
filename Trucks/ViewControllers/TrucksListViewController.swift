//
//  TrucksListViewController.swift
//  Trucks
//
//  Created by PrakashNK on 08/12/21.
//

import UIKit
import RxSwift
import RxCocoa
import MapKit
import GoogleMaps

class TrucksListViewController: UIViewController {
    
    @IBOutlet weak var trucksListTable: UITableView!
    @IBOutlet var truckListMapView: GMSMapView!
    
    var isListView: Bool = true
    var isSearching: Bool = false
    
    var viewModel = TrucksListViewModel()
    let disposeBag = DisposeBag()
    var markers = [GMSMarker]()

     var truckSearchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.showsCancelButton = true
        searchBar.searchBarStyle = .default
        searchBar.placeholder = " Search Here....."
        searchBar.sizeToFit()
        return searchBar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBinding()
        setupNavigationBarItems()
        setupSearchBar()
    }
}

// setup
extension TrucksListViewController {
    private func setupNavigationBarItems(){
        let menuBarButton = UIBarButtonItem(image:UIImage(named: "baseline_menu_black_24pt"), style: .plain, target: self, action: nil)
        self.navigationItem.leftBarButtonItem =  menuBarButton
        let refreshButton = UIBarButtonItem(image:UIImage(named: "baseline_loop_black_24pt"), style: .plain, target: self, action: nil)
        let searchButton = UIBarButtonItem(image:UIImage(named: "baseline_search_black_24pt"), style: .plain, target: self, action: #selector(didTapSearch))
        let toggleImage = (isListView) ? UIImage(named: "baseline_map_black_32pt") : UIImage(named: "baseline_list_black_24pt")
        let toggleButton = UIBarButtonItem(image: toggleImage, style: .plain, target: self, action: #selector(didTapToggle))
        if isListView {
            self.navigationItem.rightBarButtonItems =  [toggleButton, searchButton , refreshButton]
        }
        else {
            self.navigationItem.rightBarButtonItems =  [toggleButton , refreshButton]
        }
        self.title = "Trucks"
    }
    
    
    private func setupSearchBar() {
        truckSearchBar.delegate = self
        trucksListTable.tableHeaderView = (isSearching) ? truckSearchBar : UIView()
    }
    private func setupBinding() {
        trucksListTable.register(TruckCell.nib, forCellReuseIdentifier: TruckCell.identifier)
        viewModel.items.bind(to: trucksListTable.rx.items(cellIdentifier: TruckCell.identifier, cellType: TruckCell.self)) {  (row,truck,cell) in
            cell.viewModel = truck
        }.disposed(by: disposeBag)
        viewModel.getTrucks()
    }
     
    func makeAnnotations() {
        truckListMapView.clear()
        markers = []
        for index in 0..<viewModel.filteredTrucks.count {
            let marker: GMSMarker = GMSMarker()
            let truck = viewModel.filteredTrucks[index]
            if let lat = truck.lastWaypoint?.lat, let lng = truck.lastWaypoint?.lng {
                let coordinate = CLLocationCoordinate2D(latitude: lat, longitude: lng)
                marker.title = truck.truckNumber ?? "" // Setting title
                marker.snippet = ""
                marker.set(image: UIImage(named: "baseline_local_shipping_black_24pt")!, with: getTruckcolor(truck: truck))
                marker.appearAnimation = .pop
                marker.position = coordinate
                DispatchQueue.main.async {
                    marker.map = self.truckListMapView
                }
                markers.append(marker)
            }
        }
        var bounds = GMSCoordinateBounds()
        for marker in self.markers {
            bounds = bounds.includingCoordinate(marker.position)
        }
        truckListMapView.animate(with: GMSCameraUpdate.fit(bounds, with: UIEdgeInsets(top: 50.0 , left: 50.0 ,bottom: 50.0 ,right: 50.0)))
    }
}

extension TrucksListViewController {
    
    @objc func didTapToggle() {
        truckSearchBar.resignFirstResponder()
        trucksListTable.isHidden = isListView
        truckListMapView.isHidden = !isListView
        isListView = !isListView
        if !isListView {
            makeAnnotations()
        }
        setupNavigationBarItems()
    }
    
    @objc func didTapSearch() {
        isSearching = !isSearching
        trucksListTable.reloadData()
        setupSearchBar()
    }
}

extension TrucksListViewController: UISearchBarDelegate {
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        searchBar.showsCancelButton = false
        isSearching = false
        setupSearchBar()
        viewModel.getTrucks()
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        viewModel.getTrucksBySearch(searchString: searchBar.text ?? "")
        searchBar.resignFirstResponder()
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.getTrucksBySearch(searchString: searchBar.text ?? "")
    }
}
