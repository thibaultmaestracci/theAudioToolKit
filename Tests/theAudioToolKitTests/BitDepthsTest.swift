//
//  File.swift
//
//
//  Created by thunderduck on 17/01/2022.
//

import Foundation
import XCTest
@testable import theAudioToolKit

class BitDepthTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    func test_GivenBitDepths_WhenGetDefautValue_Shouldbe() {
        let samplerate = BitDepths.defaultIndexValue
        XCTAssertNotNil(samplerate)
        XCTAssertEqual(samplerate, 0)

    }

    func test_GivenBitDepths_WhenGetNameValue_Shouldbe() {
        XCTAssertEqual(BitDepths.bd16.name, "16")
        XCTAssertEqual(BitDepths.bd24.name, "24")
        XCTAssertEqual(BitDepths.bd32.name, "32")
    }
}
