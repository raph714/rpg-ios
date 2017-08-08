//
//  ViewController.swift
//  ShadowCity
//
//  Created by Raphael DeFranco on 4/30/17.
//  Copyright © 2017 Redshirt. All rights reserved.
//

import UIKit
import GoogleMaps

class GameViewController: UIViewController {
    
    @IBOutlet weak var mapContainer: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        addSettingsButton()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func loadView() {
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
        let camera = GMSCameraPosition.camera(withLatitude: 45.460259, longitude: -122.695527, zoom: 17.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        
        do {
            // Set the map style by passing the URL of the local file.
            if let styleURL = Bundle.main.url(forResource: "mapStyle", withExtension: "json") {
                mapView.mapStyle = try GMSMapStyle(contentsOfFileURL: styleURL)
            } else {
                NSLog("Unable to find style.json")
            }
        } catch {
            NSLog("One or more of the map styles failed to load. \(error)")
        }
        
        mapView.settings.zoomGestures = false
        mapView.settings.tiltGestures = false
        mapView.settings.scrollGestures = false
        
        view = mapView
    }
    
    func addSettingsButton() {
        let settings = UIButton.init(type: .custom)
        settings.setTitle("Settings", for: .normal)
        settings.translatesAutoresizingMaskIntoConstraints = false
        settings.backgroundColor = UIColor.white.withAlphaComponent(0.25)
        settings.layer.cornerRadius = 5.0
        settings.addTarget(self, action: #selector(settingsButtonHit), for: .touchUpInside)
        
        let heightConstraint = NSLayoutConstraint.init(item: settings, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 44)
        let widthConstraint = NSLayoutConstraint.init(item: settings, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 100)
        let topConstraint = NSLayoutConstraint.init(item: settings, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 24)
        let rightConstraint = NSLayoutConstraint.init(item: settings, attribute: .right, relatedBy: .equal, toItem: self.view, attribute: .right, multiplier: 1, constant: -8)
        
        view.addSubview(settings)
        view.addConstraints([heightConstraint, widthConstraint, topConstraint, rightConstraint])
    }
    
    func settingsButtonHit() {
        let alert = UIAlertController.init(title: "Settings", message: "Choose your fate.", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Log Out", style: .default, handler: { (_) in
            UserAuth.logOut()
            self.dismiss(animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

