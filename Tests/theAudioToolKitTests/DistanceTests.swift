//
//  ResultTestCase.swift
//  thunderToolTests
//
//  Created by thunderduck on 09/05/2021.
//

import XCTest
@testable import theAudioToolKit

class DistanceTestCase: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    func test_GivenUnitDistanceEnume_WhenAccessDft_ThenShouldBeThat() {
        let dft = DistanceUnit.dft
        XCTAssertEqual(dft, 1)
        let count = DistanceUnit.count
        XCTAssertEqual(count, 3)
    }

    func test_GivenUnitDistanceEnum_WhenGettingDescription_ShouldBeThat() {
        let mmVal = DistanceUnit.millimetre.description
        let cmVal = DistanceUnit.centimetre.description
        let mVal = DistanceUnit.metre.description
        XCTAssertEqual(mmVal, "mm")
        XCTAssertEqual(cmVal, "cm")
        XCTAssertEqual(mVal, "m")
    }

    func test_GivenResultDistance_WhenGettingStr_unit_ShouldBeThat() {
        let mmVal = Distance(data: 1.1234, unit: .millimetre).strUnit
        let cmVal = Distance(data: 1.1234, unit: .centimetre).strUnit
        let mVal = Distance(data: 1.1234, unit: .metre).strUnit
        XCTAssertEqual(mmVal, "mm")
        XCTAssertEqual(cmVal, "cm")
        XCTAssertEqual(mVal, "m")
    }

    func testRoundToZero() {
        let test = Distance(data: 1.1234, unit: .metre)
        test.convert(to: .metre, rounded: .zero)
        XCTAssertEqual(test.unit, DistanceUnit.metre)
        XCTAssertEqual("1", test.strData)
    }

    func testRoundToOne() {
        let test = Distance(data: 1.1234, unit: .metre)
        test.convert(to: .metre, rounded: .one)
        XCTAssertEqual(test.unit, DistanceUnit.metre)
        XCTAssertEqual("1.1", test.strData)
    }

    func testRoundToTwo() {
        let test = Distance(data: 1.1234, unit: .metre)
        test.convert(to: .metre, rounded: .two)
        XCTAssertEqual(test.unit, DistanceUnit.metre)
        XCTAssertEqual("1.12", test.strData)
    }

    func testConv1() {
        let test = Distance(data: 1.1234, unit: .metre)
        test.convert(to: .millimetre, rounded: .one)
        XCTAssertEqual(test.unit, DistanceUnit.millimetre)
        XCTAssertEqual("1123.4", test.strData)
    }

    func testConv2() {
        let test = Distance(data: 1234, unit: .millimetre)
        test.convert(to: .metre, rounded: .one)
        XCTAssertEqual(test.unit, DistanceUnit.metre)
        XCTAssertEqual("1.2", test.strData)
    }

    func testConv3() {
        let test = Distance(data: 123_456, unit: .centimetre)
        test.convert(to: .metre, rounded: .one)
        XCTAssertEqual(test.unit, DistanceUnit.metre)
        XCTAssertEqual("1234.6", test.strData)
    }

    func testConv4() {
        let test = Distance(data: 123_456, unit: .centimetre)
        test.convert(to: .metre, rounded: .two)
        XCTAssertEqual(test.unit, DistanceUnit.metre)
        XCTAssertEqual("1234.56", test.strData)
    }

    func testConv5() {
        let test = Distance(data: 0.01, unit: .metre)
        test.convert(to: .millimetre, rounded: .one)
        XCTAssertEqual(test.unit, DistanceUnit.millimetre)
        XCTAssertEqual("10.0", test.strData)
    }

    func testConv6() {
        let test = Distance(data: 0.01, unit: .metre)
        test.convert(to: .millimetre, rounded: .zero)
        let test2 = Distance(data: 0.07, unit: .metre)
        test2.convert(like: test)
        XCTAssertEqual(test.unit, DistanceUnit.millimetre)
        XCTAssertEqual("70", test2.strData)
    }
}
