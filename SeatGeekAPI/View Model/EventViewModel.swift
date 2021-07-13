//
//  EventViewModel.swift
//  SeatGeekAPI
//
//  Created by Hin Wong on 7/10/21.
//

import UIKit

//array view model
class EventViewModel {
    let eventInformation: EventResponse
//    let eventSpecifics: Event?
//    let performerImage: PerformerImages?
    
    init(eventResponse: EventResponse) {
        self.eventInformation = eventResponse
        //self.performerImage = performerImage
//        self.performerImage = eventResponse.events?.first?.performers?.first?.images
//        let imageData = try? Data(contentsOf: URL(string: self.performerImage?.huge ?? "")!)
//        let uiImage = UIImage(data: imageData!)
//        print(uiImage)
//        self.eventSpecifics = nil
    }
    
//    init(eventResponse: EventResponse, performerImage: PerformerImages, eventSpecifics: Event) {
//        self.eventInformation = eventResponse
//        self.performerImage = performerImage
//        self.eventSpecifics = eventSpecifics
//    }
    
//    func getVenueAt(indexPath: IndexPath)  -> String {
//        self.eventInformation.events?[indexPath.row].venue?.address ?? "N/A"
//    }
//
//    func getEventDate(indexPath: IndexPath) -> String {
//        self.eventInformation.events?[indexPath.row].datetimeUTC ?? "N/A"
//    }
//
//    func getEventTitle(indexPath: IndexPath) -> String {
//        self.eventInformation.events?[indexPath.row].title ?? "N/A"
//    }
//
//    func displayLocationImage(indexPath: IndexPath) -> String {
//        self.eventInformation.events?[indexPath.row].venue?.displayLocation ?? "N/A"
//    }
//
//    func getPerformerImageURL(indexPath: IndexPath) -> String {
//        self.performerImage?.huge ?? "N/A"
//    }
    
    func getNumberOfEvents() -> Int {
        self.eventInformation.events?.count ?? 0
    }
    
    //create a function that returns a details vm
    func createVM(num: Int) -> EventDetailsViewModel? {
        let event = eventInformation.events?[num]
        return EventDetailsViewModel(event: event!)
    }
    
}
