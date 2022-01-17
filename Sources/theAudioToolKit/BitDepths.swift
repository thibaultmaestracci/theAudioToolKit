//
//  BitDepth.swift
//  thunderTool
//
//  Created by thunderduck on 06/07/2021.
//

import Foundation

public enum BitDepths: Int, CaseIterable {
    case bd16 = 0
    case bd24
    case bd32

    static var defaultIndexValue: Int { 0 }

    var value: Int {
        switch self {
        case .bd16: return 16
        case .bd24: return 24
        case .bd32: return 32
        }
    }

    var name: String {
        switch self {
        case .bd16: return "16"
        case .bd24: return "24"
        case .bd32: return "32"
        }
    }
}
