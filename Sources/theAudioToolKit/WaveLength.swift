//
//  WaveLengthData.swift
//  thunderTool v0.92
//
//  Created by thunderduck on 09/05/2021.
//

import Foundation

public struct WaveLengthData {

    static var freqValues = [20, 25, 31, 35,
                    40, 50, 63, 70,
                    80, 100, 125, 140,
                    160, 200, 250, 280,
                    320, 400, 500, 560,
                    640, 800, 1000, 1200,
                    1400, 1600, 1800, 2000,
                    2200, 2400, 2600, 2800, 3000, 3400, 3800,
                    4200, 5000, 6000, 7000,
                    8000, 9000, 10000, 12000, 14000, 16000, 18000, 20000]

    static var freqText = ["20 Hz", "25 Hz", "31 Hz", "35 Hz",
                    "40 Hz", "50 Hz", "63 Hz", "70 Hz",
                    "80 Hz", "100 Hz", "125 Hz", "140 Hz",
                    "160 Hz", "200 Hz", "250 Hz", "280 Hz",
                    "320 Hz", "400 Hz", "500 Hz", "560 Hz",
                    "640 Hz", "800 Hz", "1 kHz", "1.2 kHz",
                    "1.4 kHz", "1.6 kHz", "1.8 kHz", "2 kHz",
                    "2.2 kHz", "2.4 kHz", "2.6 kHz", "2.8 kHz", "3 kHz", "3.4 kHz", "3.8 kHz",
                    "4.2 kHz", "5 kHz", "6 kHz", "7 kHz",
                    "8 kHz", "9 kHz", "10 kHz", "12 kHz", "14 kHz", "16 kHz", "18 kHz", "20 kHz"]

    var freqDftSelected = 12
}

public struct WaveLengthCalc {

    var freqHz: Int
    var soundspeed: SoundSpeeds

    enum WaveLengthFactor: Double {
        case fullWave = 1.0
        case halfWave = 2.0
        case quarWave = 4.0
    }

    func getDistance(for factor: WaveLengthFactor, unit: DistanceUnit) -> Distance {
        var calcData = ( Double(soundspeed.value) / Double(freqHz) * 1000)
        let calcUnit = DistanceUnit.millimetre
        calcData /= factor.rawValue
        let result = Distance(data: calcData, unit: calcUnit)

        result.convert(to: unit, rounded: .two)
        return result
    }

}
