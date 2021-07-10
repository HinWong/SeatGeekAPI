//
//  EventViewModel.swift
//  SeatGeekAPI
//
//  Created by Hin Wong on 7/10/21.
//

import Foundation

class EventViewModel {
    let eventInformation: EventResponse?
    init(eventResponse: EventResponse) {
        self.eventInformation = eventResponse
    }
    
    
}
