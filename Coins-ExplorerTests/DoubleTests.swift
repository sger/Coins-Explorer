//
//  DoubleTests.swift
//  Coins-ExplorerTests
//
//  Created by Spiros Gerokostas on 30/8/20.
//

import XCTest
@testable import Coins_Explorer

class DoubleTests: XCTestCase {

    func testDouble_whenDecimalPlacesAreTwo_returnsCorrectDoubleNumber() {
        let number = 1.3242342342342342
        XCTAssertEqual(number.rounded(toPlaces: 2), 1.32)
    }
    
    func testDouble_whenDecimalPlacesAreThree_returnsCorrectDoubleNumber() {
        let number = 1.3242342342342342
        XCTAssertEqual(number.rounded(toPlaces: 3), 1.324)
    }
    
    func testDouble_whenDecimalPlacesAreThree_returnsWrongDoubleNumber() {
        let number = 2.690
        XCTAssertNotEqual(number.rounded(toPlaces: 5), 1.324)
    }
    
    func testDouble_whenDecimalPlacesAreThree_returnsCorrectFormattedString() {
        let number = 1.3242342342342342
        XCTAssertEqual(number.formattedPercent(toPlaces: 3), "1.324%")
    }
    
    func testDouble_whenDecimalPlacesAreTwo_returnsWrongFormattedString() {
        let number = 1.3
        XCTAssertNotEqual(number.formattedPercent(toPlaces: 3), "1.324%")
    }
}
