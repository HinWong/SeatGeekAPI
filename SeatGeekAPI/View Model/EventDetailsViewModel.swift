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
        self.event.title ?? "N/A"
    }
    
    func getEventDate() -> String {
        self.event.datetimeLocal ?? "N/A"
    }
    
    func getEventLocation() {
        self.event.venue
    }
    
    func getVenueLocation() -> String {
        self.event.venue?.address ?? "N/A"
    }
    
    func displayVenueLocation() -> String {
        self.event.venue?.displayLocation ?? "N/A"
    }
}
