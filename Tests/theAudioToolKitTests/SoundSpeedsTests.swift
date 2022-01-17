//
//  File.swift
//  
//
//  Created by thunderduck on 17/01/2022.
//

import Foundation
import XCTest
@testable import theAudioToolKit

class SoundSpeedsTestCase: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    func test_GivenSoundspeeds_WhenGetDefautValue_Shouldbe() {
        let soundspeed = SoundSpeeds.defaultIndexValue
        XCTAssertNotNil(soundspeed)
        XCTAssertEqual(soundspeed, 2)

    }

    func test_GivenSoundspeeds_WhenGetNameValue_Shouldbe() {
        XCTAssertEqual(SoundSpeeds.ss00c.name, "0°c")
        XCTAssertEqual(SoundSpeeds.ss10c.name, "10°c")
        XCTAssertEqual(SoundSpeeds.ss15c.name, "15°c")
        XCTAssertEqual(SoundSpeeds.ss20c.name, "20°c")
        XCTAssertEqual(SoundSpeeds.ss30c.name, "30°c")
    }
}
