//
//  EventTableViewCell.swift
//  FetchRewards
//
//  Created by Chad Parker on 4/13/21.
//

import UIKit

class EventTableViewCell: UITableViewCell {
    
    var event: Event! {
        didSet {
            updateViews()
        }
    }
    
    @IBOutlet weak var eventImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func updateViews() {
        titleLabel.text = event.title
        locationLabel.text = event.displayLocation
        dateLabel.text = DateFormatter.dateTimeForDisplay.string(from: event.date)
        
        if let imageURL = URL(string: event.imageURLString) {
            eventImageView.loadNetworkImage(url: imageURL)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
