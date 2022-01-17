//
//  BasicNoteTestCase.swift
//  thunderToolTests
//
//  Created by thunderduck on 17/06/2021.
//

import XCTest
@testable import theAudioToolKit

class BasicNoteTestCase: XCTestCase {

    var root: BasicRootNotes!

    override func setUp() {
        super.setUp()
        root = BasicRootNotes(tuning: .hz440)
    }

    func test_GivenNewRootNote_WhenInstanciate_SouldBe() throws {
        XCTAssertEqual(root.rootNotes.count, 132)
    }

    func test_GivenNewRootNote_WhenfindNote_SouldBe() throws {
        let result = root.findNote(from: 1000)
        XCTAssertEqual(result.count, 2)
    }

    func test_GivenNewNote_WhenGetName_ShouldBe() throws {
        let noteC = BasicNote(rootNote: .cFlat, octave: .oct0, tuning: .hz440)
        XCTAssertEqual(noteC.name, "C")
        let noteF = BasicNote(rootNote: .fFlat, octave: .oct0, tuning: .hz440)
        XCTAssertEqual(noteF.name, "F")
    }
    
    // MARK: 440HZ

    func test_GivenC0_WhenGettingFrequencyat440_SouldBe() throws {
        let test = BasicNote(rootNote: .cFlat, octave: .oct0, tuning: .hz440)
        XCTAssertEqual(test.frequencyHz, 16)
    }

    func test_GivenD2_WhenGettingFrequencyat440_SouldBe() throws {
        let test = BasicNote(rootNote: .dFlat, octave: .oct2, tuning: .hz440)
        XCTAssertEqual(test.frequencyHz, 73)
        XCTAssertEqual(test.name, "D")
    }

    func test_GivenE4_WhenGettingFrequencyat440_SouldBe() throws {
        let test = BasicNote(rootNote: .eFlat, octave: .oct4, tuning: .hz440)
        XCTAssertEqual(test.frequencyHz, 330)
        XCTAssertEqual(test.name, "E")
    }

    func test_GivenB9_WhenGettingFrequencyat440_SouldBe() throws {
        let test = BasicNote(rootNote: .bFlat, octave: .oct9, tuning: .hz440)
        XCTAssertEqual(test.frequencyHz, 15804)
        XCTAssertEqual(test.name, "B")
    }

    // MARK: 442HZ

    func test_GivenCsharp0_WhenGettingFrequencyat442_SouldBe() throws {
        let test = BasicNote(rootNote: .cSharp, octave: .oct0, tuning: .hz442)
        XCTAssertEqual(test.frequencyHz, 17)
        XCTAssertEqual(test.name, "C# / Db")
    }

    func test_GivenFsharp2_WhenGettingFrequencyat442_SouldBe() throws {
        let test = BasicNote(rootNote: .fSharp, octave: .oct2, tuning: .hz442)
        XCTAssertEqual(test.frequencyHz, 93)
        XCTAssertEqual(test.name, "F# / Gb")
    }

    func test_GivenA7_WhenGettingFrequencyat442_SouldBe() throws {
        let test = BasicNote(rootNote: .aFlat, octave: .oct7, tuning: .hz442)
        XCTAssertEqual(test.frequencyHz, 3536)
        XCTAssertEqual(test.name, "A")
    }

    func test_GivenGsharp8_WhenGettingFrequencyat442_SouldBe() throws {
        let test = BasicNote(rootNote: .gSharp, octave: .oct8, tuning: .hz442)
        XCTAssertEqual(test.frequencyHz, 6675)
        XCTAssertEqual(test.name, "G# / Ab")
    }

    // MARK: 438Hz

    func test_GivenDsharp0_WhenGettingFrequencyat438_SouldBe() throws {
        let test = BasicNote(rootNote: .dSharp, octave: .oct0, tuning: .hz438)
        XCTAssertEqual(test.frequencyHz, 19)
        XCTAssertEqual(test.name, "D# / Eb")
    }

    func test_GivenGsharp3_WhenGettingFrequencyat438_SouldBe() throws {
        let test = BasicNote(rootNote: .gFlat, octave: .oct3, tuning: .hz438)
        XCTAssertEqual(test.frequencyHz, 195)
        XCTAssertEqual(test.name, "G")
    }

    func test_GivenAsharp6_WhenGettingFrequencyat438_SouldBe() throws {
        let test = BasicNote(rootNote: .aSharp, octave: .oct6, tuning: .hz438)
        XCTAssertEqual(test.frequencyHz, 1856)
        XCTAssertEqual(test.name, "A# / Bb")
    }

    func test_GivenB8_WhenGettingFrequencyat438_SouldBe() throws {
        let test = BasicNote(rootNote: .bFlat, octave: .oct8, tuning: .hz438)
        XCTAssertEqual(test.frequencyHz, 7866)
    }

}
