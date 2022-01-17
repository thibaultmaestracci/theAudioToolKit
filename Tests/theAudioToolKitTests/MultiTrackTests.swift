//
//  Multi_TestCase.swift
//  thunderToolTests
//
//  Created by thunderduck on 12/05/2021.
//

import XCTest
@testable import theAudioToolKit

class MultiTestCase: XCTestCase {

    var multi: MultiTrack!

    override func setUp() {
        super.setUp()
        multi = MultiTrack(.sr480, .bd24, 24, 60)
    }

    func test_GivenMultiTrack_WhenAccessgitBitRate_ItsSholdBeThat() {
        let bitrate = multi.getBitRate()
        XCTAssertNotNil(bitrate)
        XCTAssertEqual(bitrate.value, "27.6")
        XCTAssertEqual(bitrate.unit, " Mb/s")
    }

    func test_GivenMultiTrack_WhenAccessgitMonoFileSize_ItsSholdBeThat() {
        let mono = multi.getMonoSize()
        XCTAssertNotNil(mono)
        XCTAssertEqual(mono.value, "518.4")
        XCTAssertEqual(mono.unit, " Mo")
    }

    func test_GivenMultiTrack_WhenAccessingWarning_shouldBeOK() {
        XCTAssertFalse(multi.warning())
    }

    func test_GivenDifferentsMulti_WhenAccessingWarning_shouldBeFalse() {

        let bigBitrate = MultiTrack(.sr192, .bd32, 192, 1)
        XCTAssertTrue(bigBitrate.warning())

        let bigMonofile = MultiTrack(.sr960, .bd16, 1, 360)
        XCTAssertTrue(bigMonofile.warning())

        let smallMonoFile = MultiTrack(.sr441, .bd16, 1, 1)
        XCTAssertFalse(smallMonoFile.warning())

        let mediumFile = MultiTrack(.sr960, .bd24, 105, 215)
        XCTAssertFalse(mediumFile.warning())
        
        let mediumFileExt = MultiTrack(.sr384, .bd24, 21, 12)
        XCTAssertFalse(mediumFileExt.warning())
    }

    func test_GivenInfoData_WhengetResult_ShouldBeOkInByte() {
        let data = 16000
        let infoData = InfoData()
        let test = infoData.getInfoResult(dataInBit: data, format: .byte, mode: .basic)
        XCTAssertNotNil(test)
        XCTAssertEqual(test.value, "2.0")
        XCTAssertEqual(test.unit, " kB")
    }

    func test_GivenMultiTrack_WhenGetResult_ShouldBeOk() {
        let test = MultiTrack(.sr441, .bd16, 1, 90)
        XCTAssertNotNil(test)
        XCTAssertEqual(test.getTimeFormated(), "1 h 30 m")
    }
    
    func test_GivenMultiTrack_WhenGetInfoResult_ShouldBeOk() {
        let test = MultiTrack(.sr441, .bd16, 1, 90)
        
        XCTAssertEqual(test.getSize().value, "476.3")
        XCTAssertEqual(test.getSize().unit, " Mo")
    }

    
}
