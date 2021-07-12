//
//  EventsLookupViewController.swift
//  SeatGeekAPI
//
//  Created by Hin Wong on 7/10/21.
//

import UIKit

class EventsLookupViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        eventsTableView.delegate = self
        eventsSearchBar.delegate = self
    }
    
    @IBOutlet var eventsTableView: UITableView!
    @IBOutlet weak var eventsSearchBar: UISearchBar!
    
    var eventsVM: EventViewModel?
}

//MARK: - Table view logic
extension EventsLookupViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}

//MARK: - Search bar logic
extension EventsLookupViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let eventsLookup = eventsSearchBar.text, !eventsLookup.isEmpty else {return}
        NetworkManager.fetchEvents(searchTerm: eventsLookup) { [weak self]  result in
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    print(response)
                    self?.eventsTableView.reloadData()
                case .failure(let error):
                    print(error,error.localizedDescription)
                }
            }
        }
    }
    
}
