//
//  Units.swift
//  thunderTool v0.92
//
//  Created by thunderduck on 09/05/2021.
//

import Foundation

public enum DistanceUnit: Int {
    case millimetre = 0
    case centimetre = 1
    case metre =  2

    public static var count: Int { return 3 }
    public static var dft: Int { 1 }

    public var description: String {
        switch self {
        case .millimetre: return "mm"
        case .centimetre: return "cm"
        case .metre : return "m"
        }
    }

    public var multiplierValue: Double {
        switch self {
        case .millimetre: return 1
        case .centimetre: return 10
        case .metre : return 1_000
        }
    }
}

public enum Decimal {
    case zero
    case one
    case two
}

public class Distance: Equatable {
    public static func == (lhs: Distance, rhs: Distance) -> Bool {
        return (lhs.data == rhs.data) && (lhs.unit == rhs.unit) && (lhs.decimal == rhs.decimal)
    }

    public var data: Double
    public var unit: DistanceUnit
    public var decimal: Decimal

    public init(data: Double, unit: DistanceUnit, decimal: Decimal = .two) {
        self.data = data
        self.unit = unit
        self.decimal = decimal
    }

    public var strData: String {
        if decimal == Decimal.zero {
            return String(Int(data))
        } else {
            return String(data)
        }
    }

    public var strUnit: String {
        return String(unit.description)
    }

    public func convert(like: Distance) {
        self.convert(to: like.unit, rounded: like.decimal)
    }

    public func convert(to newUnit: DistanceUnit, rounded: Decimal) {
        // CONVERT
        if unit != newUnit {
            self.data = self.data * (unit.multiplierValue / newUnit.multiplierValue )
            self.unit = newUnit
        }
        // ROUNDED
        switch rounded {
        case .zero : data = round(data);            decimal = .zero
        case .one : data  = round(data*10)/10;      decimal = .one
        case .two : data  = round(data*100)/100;    decimal = .two
        }
    }

}
