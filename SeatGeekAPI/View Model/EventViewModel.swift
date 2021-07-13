//
//  EventViewModel.swift
//  SeatGeekAPI
//
//  Created by Hin Wong on 7/10/21.
//

import Foundation

//array view model
class EventViewModel {
    let eventInformation: EventResponse
    let eventSpecifics: Event?
    let performerImage: PerformerImages?
    
    init(eventResponse: EventResponse) {
        self.eventInformation = eventResponse
        self.performerImage = nil
        self.eventSpecifics = nil
    }
    
    init(eventResponse: EventResponse, performerImage: PerformerImages, eventSpecifics: Event) {
        self.eventInformation = eventResponse
        self.performerImage = performerImage
        self.eventSpecifics = eventSpecifics
    }
    
    func getVenueAt(indexPath: IndexPath)  -> String {
        self.eventInformation.events?[indexPath.row].venue?.address ?? "N/A"
    }
    
    func getEventDate(indexPath: IndexPath) -> String {
        self.eventInformation.events?[indexPath.row].datetimeUTC ?? "N/A"
    }
    
    func getEventTitle(indexPath: IndexPath) -> String {
        self.eventInformation.events?[indexPath.row].title ?? "N/A"
    }
    
    func displayLocationImage(indexPath: IndexPath) -> String {
        self.eventInformation.events?[indexPath.row].venue?.displayLocation ?? "N/A"
    }
    
    func getPerformerImage() -> String {
        self.performerImage?.huge ?? "N/A"
    }
    
    func getNumberOfEvents() -> Int {
        self.eventInformation.events?.count ?? 1
    }
    
}
