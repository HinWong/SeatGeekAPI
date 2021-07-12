//
//  EventsTableViewCell.swift
//  SeatGeekAPI
//
//  Created by Hin Wong on 7/12/21.
//

import UIKit

class EventsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var eventsImageView: UIImageView!
    @IBOutlet weak var eventTitleLabel: UILabel!
    @IBOutlet weak var eventLocationLabel: UILabel!
    @IBOutlet weak var eventTimeLabel: UILabel!
    
    var cellViewModel: EventViewModel? {
        didSet {
            DispatchQueue.main.async {
                self.updateLabels()
            }
        }
    }
    
    func updateLabels() {
        if let cellViewModel = cellViewModel {
            eventTitleLabel.text = cellViewModel.getEventTitle()
            eventLocationLabel.text = cellViewModel.getVenueAt()
            eventTimeLabel.text = cellViewModel.getEventDate()
            //eventsImageView.image = cellViewModel.getPerformerImage()
        }
    }
    
}
