//
//  Static.swift
//  Baduuut
//
//  Created by Jevon Levin on 21/03/23.
//

import Foundation

let globalTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

let welcomeMessages: [String] = [
    "We'll be stretching your limits and reminding you that sitting on your butt all day won't make it any bigger.",
    "Welcome to our app, where we'll nag you more than your ex ever did."
    ,"Congrats! You're now part of our app's exclusive club of people who refuse to be a couch potato."
    ,"Welcome, welcome! Time to get off your tush and stretch like a cat on catnip."
    ,"Glad you could join us! We'll be reminding you to stretch those noodle arms until they become spaghetti biceps."
    ,"You're officially a part of our app's cult...\nI mean, community, dedicated to stretching your body and your limits."
    ,"Welcome to our app, where we'll stretch your patience along with your muscles."
    ,"Congrats, you made the right choice! Stretching is the only workout you can do while eating pizza."
    ,"Thanks for joining our app, where we believe that stretching is like coffee - it's always a good idea, and it's never too late to start."
]

let reminderMessages: [String] = [
    "Time to stretch, lazy bones! Our app's got your back (and your hammies).",
    "No pain, no gain. Use our app."
    ,"Stretch, or regret it later."
    ,"Flex those muscles, buttercup."
    ,"Bend it like our app says."
    ,"Sore today, strong tomorrow."
    ,"Get flexible, no excuses."
    ,"Stretch or snap. You decide."
    ,"Don't be stiff. Open our app."
]


struct Movement{
    var name: String
    var duration: Int
    var lottieFileName: String
}

let movements: [Movement] = [
    Movement(name: "Movement Dummy", duration: 25, lottieFileName: "dummy-2")
]
