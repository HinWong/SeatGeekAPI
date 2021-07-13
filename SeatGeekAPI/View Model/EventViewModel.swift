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
    
    init(eventResponse: EventResponse) {
        self.eventInformation = eventResponse
    }
    
    func getNumberOfEvents() -> Int {
        self.eventInformation.events?.count ?? 0
    }
    
    //create a function that returns a details vm
    func createVM(num: Int) -> EventDetailsViewModel? {
        let event = eventInformation.events?[num]
        return EventDetailsViewModel(event: event!)
    }
    
}
