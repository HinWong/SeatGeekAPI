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
//        didSet {
//            DispatchQueue.main.async {
//                self.eventsTableView.reloadData()
//            }
//        }
    
    var eventDetailsVM: EventDetailsViewModel?
}

//MARK: - Table view logic
extension EventsLookupViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventsVM?.getNumberOfEvents() ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = eventsTableView.dequeueReusableCell(withIdentifier: "eventCell") as? EventsTableViewCell else {return UITableViewCell()}
        cell.eventLocationLabel.text = eventsVM?.getVenueAt(indexPath: indexPath)
        cell.eventTitleLabel.text = eventsVM?.getEventTitle(indexPath: indexPath)
        cell.eventTimeLabel.text = eventsVM?.getEventDate(indexPath: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "EventsDetailVC") as? EventsDetailViewController {
            let detailsVM = EventDetailsViewModel(event: (eventsVM?.eventInformation.events?[indexPath.row])!)
            vc.detailsVM = detailsVM
            self.navigationController?.pushViewController(vc, animated: true)
        }
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
                    self?.eventsVM = EventViewModel(eventResponse: response)
                    self?.eventsTableView.reloadData()
                case .failure(let error):
                    print(error,error.localizedDescription)
                }
            }
        }
    }
    
}
