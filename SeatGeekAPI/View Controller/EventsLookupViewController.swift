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
        eventsTableView.dataSource = self
    }
    
    @IBOutlet var eventsTableView: UITableView!
    @IBOutlet weak var eventsSearchBar: UISearchBar!
    
    var eventsVM: EventViewModel?
}

//MARK: - Table view logic
extension EventsLookupViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventsVM?.getNumberOfEvents() ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = eventsTableView.dequeueReusableCell(withIdentifier: "eventCell") as? EventsTableViewCell else {return UITableViewCell()}
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
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
                    //Something is missing here...
                    print(response)
                    self?.eventsTableView.reloadData()
                case .failure(let error):
                    print(error,error.localizedDescription)
                }
            }
        }
    }
    
}
