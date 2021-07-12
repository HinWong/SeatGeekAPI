//
//  EventViewModel.swift
//  SeatGeekAPI
//
//  Created by Hin Wong on 7/10/21.
//

import Foundation

class EventViewModel {
    let eventInformation: EventResponse
    let performerImage: PerformerImages
    init(eventResponse: EventResponse, performerImage: PerformerImages) {
        self.eventInformation = eventResponse
        self.performerImage = performerImage
    }
    
    func getVenueAt(indexPath: IndexPath)  -> String {
        self.eventInformation.events?[indexPath.row].venue?.address ?? "N/A"
    }
    
    func getEventDate(indexPath: IndexPath) -> String {
        self.eventInformation.events?[indexPath.row].announceDate ?? "N/A"
    }
    
    func getEventTitle(indexPath: IndexPath) -> String {
        self.eventInformation.events?[indexPath.row].title ?? "N/A"
    }
    
    func getLocation(indexPath: IndexPath) -> String {
        self.eventInformation.events?[indexPath.row].venue?.address ?? "N/A"
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
