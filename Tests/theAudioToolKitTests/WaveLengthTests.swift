//
//  WaveLengthTestCase.swift
//  thunderToolTests
//
//  Created by thunderduck on 08/07/2021.
//

import XCTest
@testable import theAudioToolKit

class WaveLengthTestCase: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    func test_GivenWaveLengthOf1000Hz_WhenAccessgitDistance_ItsShouldBeThat() {
        let wave = WaveLengthCalc(freqHz: 1000, soundspeed: .ss15c)
        let test = Distance(data: 34, unit: .centimetre)

        XCTAssertNotNil(wave)
        XCTAssertEqual(wave.getDistance(for: .fullWave, unit: .centimetre), test)

    }

    func test_GivenWaveLengthof20Hz_WhenAccessgitDistance_ItsShouldBeThat() {
        let wave = WaveLengthCalc(freqHz: 20, soundspeed: .ss00c)
        let test = Distance(data: 16550, unit: .millimetre)

        XCTAssertNotNil(wave)
        XCTAssertEqual(wave.getDistance(for: .fullWave, unit: .millimetre), test)
    }
    
    func test_GivenWaveLengthof420Hz_WhenAccessgitDistance_ItsShouldBeThat() {
        let wave = WaveLengthCalc(freqHz: 400, soundspeed: .ss20c)
        let test = Distance(data: 0.86, unit: .metre)

        XCTAssertNotNil(wave)
        XCTAssertEqual(wave.getDistance(for: .fullWave, unit: .metre), test)
    }

    func test_GivenWaveLengthof8000Hz_WhenAccessgitDistance_ItsShouldBeThat() {
        let wave = WaveLengthCalc(freqHz: 8000, soundspeed: .ss30c)
        let test = Distance(data: 4.36, unit: .centimetre)

        XCTAssertNotNil(wave)
        XCTAssertEqual(wave.getDistance(for: .fullWave, unit: .centimetre), test)
    }

    func test_GivenWaveLengthof20000Hz_WhenAccessgitDistance_ItsShouldBeThat() {
        let wave = WaveLengthCalc(freqHz: 20000, soundspeed: .ss10c)
        let testFullWave = Distance(data: 1.69, unit: .centimetre)
        let testHalfWave = Distance(data: 0.84, unit: .centimetre)
        let testQuarWave = Distance(data: 0.42, unit: .centimetre)

        XCTAssertNotNil(wave)
        XCTAssertEqual(wave.getDistance(for: .fullWave, unit: .centimetre), testFullWave)
        XCTAssertEqual(wave.getDistance(for: .halfWave, unit: .centimetre), testHalfWave)
        XCTAssertEqual(wave.getDistance(for: .quarWave, unit: .centimetre), testQuarWave)
    }

    func test_GivenWaveLengthData_WhenAccessing_ShouldBeNotNil() {
        XCTAssertNotNil(WaveLengthData.freqValues)
        XCTAssertNotNil(WaveLengthData.freqText)
    }
    
    func test_GivenWaveLengthData_WhenAccessing_ShouldBeSameLength() {
        XCTAssertEqual(WaveLengthData.freqValues.count, WaveLengthData.freqText.count)
    }
    
    func test_GivenWaveLengthData_WhenAccessing_ShouldBeGoodVelue() {
        XCTAssertEqual(WaveLengthData.freqValues[0], 20)
        XCTAssertEqual(WaveLengthData.freqText[0], "20 Hz")
    }
}
