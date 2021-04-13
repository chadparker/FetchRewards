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

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func updateViews() {
        textLabel?.text = event.title
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
