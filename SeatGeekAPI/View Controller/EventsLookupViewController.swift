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
}

extension EventsLookupViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}

extension EventsLookupViewController: UISearchBarDelegate {
    
}
