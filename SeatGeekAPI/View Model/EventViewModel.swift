//
//  EventViewModel.swift
//  SeatGeekAPI
//
//  Created by Hin Wong on 7/10/21.
//

import Foundation

class EventViewModel {
    let eventInformation: EventResponse
    init(eventResponse: EventResponse) {
        self.eventInformation = eventResponse
    }
    
    func getVenueAt(indexPath: IndexPath)  {
        self.eventInformation.events?[indexPath.row].venue
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
}
