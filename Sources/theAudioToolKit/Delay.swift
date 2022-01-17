//
//  TimeDistance.swift
//  thunderTool v0.92
//
//  Created by thunderduck on 09/04/2021.
//

import Foundation

struct Delay {

    var distance: Distance
    var soundspeed: SoundSpeeds

    // Delay in ms rounded to 2 digit
    var delayMs: Double {
        let distanceM = distance
        distanceM.convert(to: .millimetre, rounded: .one)
        let calcDelay = distanceM.data / Double(soundspeed.value)
        let roundedDelay = round(calcDelay*100)/100
        return roundedDelay
    }
}