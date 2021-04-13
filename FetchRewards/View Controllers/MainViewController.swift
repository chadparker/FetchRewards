//
//  MainViewController.swift
//  FetchRewards
//
//  Created by Chad Parker on 4/12/21.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    let seatGeekClient = SeatGeekClient()
    var eventsTableVC: EventsTableViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let eventsTableVC = segue.destination as? EventsTableViewController {
            self.eventsTableVC = eventsTableVC
        }
    }
}

extension MainViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let query = searchText
        seatGeekClient.fetchEventsMatchingQuery(query) { result in
            switch result {
            case .success(let events):
                self.eventsTableVC.events = events
            case .failure(_):
                self.presentSimpleAlert(title: "Network Error", message: "Please check your internet connection")
            }
        }
    }
}
