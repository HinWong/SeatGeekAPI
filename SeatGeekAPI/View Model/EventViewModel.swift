//
//  EventViewModel.swift
//  SeatGeekAPI
//
//  Created by Hin Wong on 7/10/21.
//

import Foundation

class EventViewModel {
    let eventInformation: EventResponse
    let eventSpecifics: Event
    let performerImage: PerformerImages
    init(eventResponse: EventResponse, performerImage: PerformerImages, eventSpecifics: Event) {
        self.eventInformation = eventResponse
        self.performerImage = performerImage
        self.eventSpecifics = eventSpecifics
    }
    
    func getVenueAt()  -> String {
        //self.eventInformation.events?[indexPath.row].venue?.address ?? "N/A"
        self.eventSpecifics.venue?.address ?? "N/A"
    }
    
    func getEventDate() -> String {
        //self.eventInformation.events?[indexPath.row].announceDate ?? "N/A"
        self.eventSpecifics.announceDate ?? "N/A"
    }
    
    func getEventTitle() -> String {
        self.eventSpecifics.title ?? "N/A"
    }
    
    func displayLocationImage(indexPath: IndexPath) -> String {
        self.eventInformation.events?[indexPath.row].venue?.displayLocation ?? "N/A"
    }
    
    func getPerformerImage() -> String {
        self.performerImage.huge ?? "N/A"
    }
    
    func getNumberOfEvents() -> Int {
        self.eventInformation.events?.count ?? 1
    }
    
}
