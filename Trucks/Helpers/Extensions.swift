//
//  Extensions.swift
//  Trucks
//
//  Created by PrakashNK on 08/12/21.
//
import UIKit
import Foundation
import MapKit
import GoogleMaps

extension UITableViewCell {
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
}

extension Int {
    func secondsToTime() -> String {
        let timeInterval = Int(getCurrentMillis()) - self
        
        let (d,h,m,s) = (timeInterval / (3600*24), timeInterval / 3600, (timeInterval % 3600) / 60, (timeInterval % 3600) % 60)
        if d > 1 {
            return "\(d)"
        }
        else if h > 1 {
            return "\(h)"
        }
        else if m > 1 {
            return "\(m)"
        }
        else if s > 1 {
            return "\(s)"
        }
        return ""
    }
    
    func getUnit() -> String {
        let timeInterval = Int(getCurrentMillis()) - self
        let (d,h,m,s) = (timeInterval / (3600*24), timeInterval / 3600, (timeInterval % 3600) / 60, (timeInterval % 3600) % 60)
        if d > 0 {
            return "days\( d>1 ? "s" : "") ago"
        }
        else if h > 0 {
            return "hour\( h>1 ? "s" : "") ago"
        }
        else if m > 0 {
            return "min\( m>1 ? "s" : "") ago"
        }
        else if s > 0 {
            return "sec\( s>1 ? "s" : "") ago"
        }
        return ""
    }
    func getUnitOnly() -> String {
        let timeInterval = Int(getCurrentMillis()) - self
        let (d,h,m,s) = (timeInterval / (3600*24), timeInterval / 3600, (timeInterval % 3600) / 60, (timeInterval % 3600) % 60)
        if d > 0 {
            return "day\( d>1 ? "s" : "")"
        }
        else if h > 0 {
            return "hour\( h>1 ? "s" : "")"
        }
        else if m > 0 {
            return "min\( m>1 ? "s" : "")"
        }
        else if s > 0 {
            return "sec\( s>1 ? "s" : "")"
        }
        return ""
    }
}

extension MKMapView {
    
    func fitAllAnnotations(with padding: UIEdgeInsets = UIEdgeInsets(top: 100, left: 100, bottom: 100, right: 100)) {
        var zoomRect: MKMapRect = .null
        annotations.forEach({
            let annotationPoint = MKMapPoint($0.coordinate)
            let pointRect = MKMapRect(x: annotationPoint.x, y: annotationPoint.y, width: 0.01, height: 0.01)
            zoomRect = zoomRect.union(pointRect)
        })
        setVisibleMapRect(zoomRect, edgePadding: padding, animated: true)
    }
    
    func fit(annotations: [MKAnnotation], andShow show: Bool, with padding: UIEdgeInsets = UIEdgeInsets(top: 100, left: 100, bottom: 100, right: 100)) {
        var zoomRect: MKMapRect = .null
        annotations.forEach({
            let aPoint = MKMapPoint($0.coordinate)
            let rect = MKMapRect(x: aPoint.x, y: aPoint.y, width: 0.1, height: 0.1)
            zoomRect = zoomRect.isNull ? rect : zoomRect.union(rect)
        })
        if show {
            addAnnotations(annotations)
        }
        setVisibleMapRect(zoomRect, edgePadding: padding, animated: true)
    }
}

extension GMSMarker {

    public func set(image: UIImage, with color : UIColor) {
        let view = UIImageView(image: image.withRenderingMode(.alwaysTemplate))
        view.tintColor = color
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.isOpaque, 0.0)
        guard let graphicsContext = UIGraphicsGetCurrentContext() else { return }
        view.layer.render(in: graphicsContext)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.icon = image
    }
    
}

class TruckAnnotation : MKPointAnnotation {
    var tag: Int
    
    init(tag: Int) {
        self.tag = tag
    }
}
