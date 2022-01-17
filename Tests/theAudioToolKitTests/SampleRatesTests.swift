//
//  File.swift
//  
//
//  Created by thunderduck on 17/01/2022.
//

import Foundation
import XCTest
@testable import theAudioToolKit

class SampleRatesTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    func test_GivenSampleRates_WhenGetDefautValue_Shouldbe() {
        let samplerate = SampleRates.defaultIndexValue
        XCTAssertNotNil(samplerate)
        XCTAssertEqual(samplerate, 0)

    }

    func test_GivenSampleRates_WhenGetNameValue_Shouldbe() {
        XCTAssertEqual(SampleRates.sr441.name, "44.1")
        XCTAssertEqual(SampleRates.sr480.name, "48")
        XCTAssertEqual(SampleRates.sr960.name, "96")
        XCTAssertEqual(SampleRates.sr192.name, "192")
        XCTAssertEqual(SampleRates.sr384.name, "384")
    }
}
