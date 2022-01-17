//
//  TimeDistance_TestCase.swift
//  thunderToolTests
//
//  Created by thunderduck on 09/04/2021.
//

import XCTest
@testable import theAudioToolKit

class DelayTestCase: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    func testGivenADistanceOf1meter_WhenAccessDelay_ItsSholdBe3ms() {
        let time = Delay(distance: Distance(data: 1.0, unit: .metre), soundspeed: .ss15c)
        XCTAssertNotNil(time.delayMs)
        XCTAssertEqual(time.delayMs, 2.94)
    }

    func testGivenADistanceOf24meter_WhenAccessDelay_ItsSholdBe70ms() {
        let time = Delay(distance: Distance(data: 24.0, unit: .metre), soundspeed: .ss15c)
        XCTAssertNotNil(time.delayMs)
        XCTAssertEqual(time.delayMs, 70.59 )
    }
}
