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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
}

extension MainViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let query = searchText
        seatGeekClient.fetchEventsMatchingQuery(query) { result in
            switch result {
            case .success(let events):
                print("✅\(events.count) events fetched")
            case .failure(let networkError):
                print("🛑Error: \(networkError)")
            }
        }
    }
}
