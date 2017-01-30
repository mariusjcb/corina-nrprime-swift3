//
//  IntentHandler.swift
//  PrimeNumberSiriIntent
//
//  Created by Marius Ilie on 30/01/17.
//  Copyright © 2017 University of Bucharest - Marius Ilie. All rights reserved.
//

import Intents

class IntentHandler: INExtension {
    override func handler(for intent: INIntent) -> Any? {
        return self
    }
}

extension IntentHandler: INSendMessageIntentHandling {
    func handle(sendMessage intent: INSendMessageIntent, completion: @escaping (INSendMessageIntentResponse) -> Void) {
        completion(INSendMessageIntentResponse.init(code: .success, userActivity: nil))
    }
}
