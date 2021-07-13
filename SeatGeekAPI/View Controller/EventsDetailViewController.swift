//
//  EventsDetailViewController.swift
//  SeatGeekAPI
//
//  Created by Hin Wong on 7/10/21.
//

import UIKit

class EventsDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateLabels()
    }
    
    var detailsVM: EventDetailsViewModel?
    
    //MARK: - Outlets
    @IBOutlet weak var eventTitleLabel: UILabel!
    @IBOutlet weak var eventLocationLabel: UILabel!
    @IBOutlet weak var eventTimeLabel: UILabel!
    @IBOutlet weak var eventVenueImageView: UIImageView!
    
    private func updateLabels() {
        eventTimeLabel.text = detailsVM?.getEventDate()
        eventTitleLabel.text = detailsVM?.getEventTitle()
        eventLocationLabel.text = detailsVM?.getEventLocation()
        //eventVenueImageView.image = detailsVM?.getDetailedImage()
    }
    
    
}
