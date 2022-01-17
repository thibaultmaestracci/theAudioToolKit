//
//  TempoTestCase.swift
//  thunderToolTests
//
//  Created by thunderduck on 08/07/2021.
//

import XCTest
@testable import theAudioToolKit

class TempoTestCase: XCTestCase {

    override func setUp() {
        super.setUp()

    }

    func test_GivenNewTempo_WhenAccess_ItsShouldBeEmpty() {
        let tempo = Tempo()
        XCTAssertNotNil(tempo)
        XCTAssertEqual(tempo.bpm(), 0)
        XCTAssertEqual(tempo.noteDelay(), 0)
    }
    
    func test_42() {
        let tempo = Tempo()
        tempo.newtap()
        tempo.newtap()
        tempo.newtap()
        tempo.newtap()
        tempo.newtap()
        tempo.setModeAndReset(mode: .average)
        XCTAssertNotNil(tempo)
        XCTAssertEqual(tempo.bpm(), 0)
        XCTAssertEqual(tempo.noteDelay(), 0)
    }
}
