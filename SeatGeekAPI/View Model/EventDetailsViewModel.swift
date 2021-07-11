//
//  EventDetailsViewModel.swift
//  SeatGeekAPI
//
//  Created by Hin Wong on 7/10/21.
//

import Foundation

class EventDetailsViewModel {
    let eventResponse: [Event]
    let event: Event
    
    init(eventResponse: [Event], event: Event) {
        self.eventResponse = eventResponse
        self.event = event
    }
    
    func getEventTitle() -> String {
        self.event.title
    }
    
    func getEventDate() -> String {
        self.event.datetimeLocal
    }
    
    func getEventLocation() -> Venue {
        self.event.venue
    }
    
    func getVenueLocation() -> String {
        self.event.venue.address
    }
    
    func displayVenueLocation() -> String {
        self.event.venue.displayLocation
    }
}
