//
//  MessageManager.swift
//  iMessage replica
//
//  Created by Biraj Dahal on 3/14/25.
//

import Foundation
import FirebaseFirestore

@Observable 
class MessageManager {

    var messages: [Message] = []

    init(isMocked: Bool = false) {
        if isMocked {
            messages = Message.mockedMessages
        } else {
            // TODO: Fetch messages from Firestore database

        }
    }

    // TODO: Save message

    // TODO: Get messages

}
