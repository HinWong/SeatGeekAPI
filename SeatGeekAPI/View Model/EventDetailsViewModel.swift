//
//  EventDetailsViewModel.swift
//  SeatGeekAPI
//
//  Created by Hin Wong on 7/10/21.
//

import Foundation

class EventDetailsViewModel {
//    let eventResponse: [Event]
    let event: Event
//    let performerImage: PerformerImages
    
    init(event: Event) {
        //self.eventResponse = eventResponse
        self.event = event
        //self.performerImage = performerImage
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
    
//    func getDetailedImage() -> String {
//        self.performerImage.huge ?? "N/A"
//    }
}
