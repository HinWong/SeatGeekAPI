//
//  EventDetailsViewModel.swift
//  SeatGeekAPI
//
//  Created by Hin Wong on 7/10/21.
//

import Foundation

class EventDetailsViewModel {
    let event: Event
    
    init(event: Event) {
        self.event = event
    }
    
    func getEventTitle() -> String {
        self.event.title ?? "N/A"
    }
    
    func getEventDate() -> String {
        self.event.datetimeLocal ?? "N/A"
    }
    
    func getEventLocation() -> String {
        self.event.venue?.address ?? "N/A"
    }
    
    func getVenueLocation() -> String {
        self.event.venue?.address ?? "N/A"
    }
    
    func displayVenueLocation() -> String {
        self.event.venue?.displayLocation ?? "N/A"
    }
    
    func getDetailedImageURL() -> String {
        self.event.performers?.first?.image ?? "N/A"
    }
}
