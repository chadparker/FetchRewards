//
//  EventDetailViewController.swift
//  FetchRewards
//
//  Created by Chad Parker on 4/13/21.
//

import UIKit

class EventDetailViewController: UIViewController {
    
    let event: Event
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    internal init(event: Event) {
        self.event = event
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = event.title
        dateLabel.text = DateFormatter.dateTimeForDisplay.string(from: event.date)
        locationLabel.text = event.displayLocation
        
        if let imageURL = URL(string: event.imageURLString) {
            imageView.loadNetworkImage(url: imageURL)
        }
    }
}
