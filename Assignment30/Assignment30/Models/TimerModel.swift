//
//  TimerModel.swift
//  Assignment30
//
//  Created by MacBook on 11.12.24.
//

import SwiftUI

struct TimerModel: Identifiable {
    var id = UUID()
    var title: String
    var duration: Int
    var timeRemaining: Int
    var isON: Bool = false
    
    init(title: String, duration: Int) {
        self.title = title
        self.duration = duration
        self.timeRemaining = duration
    }
}
