//
//  OnboardTimerView.swift
//  Baduuut
//
//  Created by Leo Harnadi on 22/03/23.
//

import SwiftUI

extension OnboardPage{
    final class ViewModel: ObservableObject{
        @Published var isActive = false
        @Published var time: String = "00:00:00"
        @Published var seconds: Float = 15
        
        private var initialTime = 0
        private var endDate = Date()
        
        func start(seconds: Float) {
            self.initialTime = Int(seconds)
            self.endDate = Date()
//            let _ = print(endDate)
            self.isActive = true
            self.endDate = Calendar.current.date(byAdding: .second, value: Int(seconds), to: endDate)!
            
//            let _ = print(endDate)
        }
        
        func reset() {
            self.seconds = Float(initialTime)
            self.isActive = false
            self.time = "00:00:00"
        }
        
        func updateCountdown(){
            guard isActive else { return }
            
            let now = Date()
            let diff = endDate.timeIntervalSince1970 - now.timeIntervalSince1970
            
            if diff <= 0 {
                self.isActive = false
                self.time = "00:00:00"
                return
            }
            
            let date = Date(timeIntervalSince1970: diff)
            let calendar = Calendar.current
            let hours = (calendar.component(.hour, from: date))-7 //kyknya -7 soalnya WIB = +7 UTC?
            let minutes = calendar.component(.minute, from: date)
            let seconds = calendar.component(.second, from: date)
            
            self.seconds = Float(seconds)
            self.time = String(format: "%02d:%02d:%02d", hours, minutes, seconds)
            
//            Debugging
//            let _ = print(hours)
//            let _ = print(date)
//            let _ = print(calendar)
//            let _ = print(now)
//            let _ = print(diff)
        }
        
        //Calculate time value from string input (from picker)
        func extractTime (selected: String) -> Float {
            let start = selected.startIndex
            let end = selected.endIndex
            let space = selected.index(start, offsetBy: 6)
            let space2 = selected.index(start, offsetBy: 8)
            var timeUnit = String(selected[space2..<end])
            var time = String(selected[space..<space2])
            time = time.trimmingCharacters(in: .whitespacesAndNewlines)
            timeUnit = timeUnit.trimmingCharacters(in: .whitespacesAndNewlines)
            
            var timeInSeconds: Float
            
            switch timeUnit {
            case "hour"..."hours":
                timeInSeconds = Float(time)! * 3600
            case "minutes":
                timeInSeconds = Float(time)! * 60
            default:
                timeInSeconds = Float(time)!
            }
            
            
            
            
            return timeInSeconds
        }
    }
}

