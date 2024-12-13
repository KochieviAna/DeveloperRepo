//
//  TimerViewModel.swift
//  Assignment30
//
//  Created by MacBook on 11.12.24.
//

import SwiftUI

class TimerViewModel: ObservableObject {
    @Published var timers: [TimerModel] = []
    private var activeTimers: [Int: Timer] = [:]
    
    func addTimer(title: String, duration: Int) {
        let newTimer = TimerModel(title: title, duration: duration)
        timers.append(newTimer)
    }
    
    func toggleTimer(index: Int) {
        guard timers.indices.contains(index) else { return }
        
        timers[index].isON.toggle()
        
        if timers[index].isON {
            startTimer(index: index)
        } else {
            stopTimer(index: index)
        }
    }
    
    private func startTimer(index: Int) {
        guard timers.indices.contains(index) else { return }
        
        if activeTimers[index] != nil {
            return
        }
        
        let timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] timer in
            guard let self = self else { return }
            
            guard self.timers.indices.contains(index) else {
                timer.invalidate()
                self.activeTimers.removeValue(forKey: index)
                
                return
            }
            
            if self.timers[index].isON && self.timers[index].timeRemaining > 0 {
                self.timers[index].timeRemaining -= 1
            } else {
                timer.invalidate()
                self.timers[index].isON = false
                self.activeTimers.removeValue(forKey: index)
            }
        }
        
        activeTimers[index] = timer
    }
    
    private func stopTimer(index: Int) {
        activeTimers[index]?.invalidate()
        activeTimers.removeValue(forKey: index)
    }
    
    func resetTimer(index: Int) {
        guard timers.indices.contains(index) else { return }
        
        timers[index].timeRemaining = timers[index].duration
        
        if timers[index].isON {
            stopTimer(index: index)
            startTimer(index: index)
        }
    }
    
    func deleteTimer(index: Int) {
        guard timers.indices.contains(index) else { return }
        
        stopTimer(index: index)
        timers.remove(at: index)
    }
}
