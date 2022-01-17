//
//  Tempo.swift
//  thunderTool v0.92
//
//  Created by thunderduck on 11/05/2021.
//

// swiftlint:disable identifier_name
import Foundation
import UIKit

public class Tempo {
    // MARK: - Private
    private var mode = CalcMode.average

    private var minValues = 2
    private var stamper = [Double]()

    private var abpm = 0.0              // Average Beat Per minutes
    private var deltap = 0.0            // Average Delay btw 2 taps (ms)
    private var akfreset = 10_000.0     // "Away From Keyboard" reset time (ms)

    private func updateData() {
        if stamper.count >= minValues && stamper.count >= 1 {
            var sum = 0.0

            for i in 1..<stamper.count {
                sum += stamper[i] - stamper[i-1]
            }
            deltap = sum / Double(stamper.count-1)
            abpm = round(60*1000/deltap*10)/10
        } else {
            abpm = 0.0
            deltap = 0.0
        }
    }

    // MARK: - Public

    public enum CalcMode: Int {
        // Max number of values used for calc
        case average = 21
        case instant = 4
    }

    public func reset() {
        stamper = [Double]()
        updateData()
    }

    public func setModeAndReset(mode: CalcMode) {
        self.mode = mode
        self.reset()
    }

    public func newtap() {
        // if afk >akfreset then reset
        let now = CACurrentMediaTime()*1000
        if let lastCall = stamper.last {
            if (now - lastCall) > akfreset {
                self.reset()
            }
        }
        if stamper.count >= mode.rawValue {
            stamper.remove(at: 0)
        }
        stamper.append(now)
        updateData()
    }

    public func bpm() -> Int {
        return Int(abpm)
    }

    public func noteDelay() -> Int {
        return Int(deltap)
    }

}
