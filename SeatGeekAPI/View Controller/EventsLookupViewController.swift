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
    var eventDetailsVM: EventDetailsViewModel?
}

//MARK: - Table view logic
extension EventsLookupViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(eventsVM?.getNumberOfEvents() ?? 0)
        return eventsVM?.getNumberOfEvents() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = eventsTableView.dequeueReusableCell(withIdentifier: "eventCell") as? EventsTableViewCell,
              let eventDetails = eventsVM?.getNumberOfEvents() else {return UITableViewCell()}
        
        let cellVM = EventDetailsViewModel(event: (eventsVM?.eventInformation.events?[indexPath.row])!)
        cell.configure(viewModel: cellVM)
        
        
        ImageCache.shared.loadImage(from: cellVM.getDetailedImageURL() ?? "") { image in
            if let visibleCell = tableView.cellForRow(at: indexPath) as? EventsTableViewCell {
                print(image)
                visibleCell.eventsImageView.image = image
            }
        }
        
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
                    //print(response)
                    self?.eventsVM = EventViewModel(eventResponse: response)
                    self?.eventsSearchBar.resignFirstResponder()
                    self?.eventsTableView.reloadData()
                case .failure(let error):
                    print(error,error.localizedDescription)
                }
            }
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        eventsSearchBar.text = nil
        eventsSearchBar.endEditing(true)
        
    }
    
}
