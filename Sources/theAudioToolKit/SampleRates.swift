//
//  SampleRates.swift
//  thunderTool
//
//  Created by thunderduck on 06/07/2021.
//

import Foundation

enum SampleRates: Int, CaseIterable {
    case sr441 = 0
    case sr480
    case sr960
    case sr192
    case sr384

    static var defaultIndexValue: Int { 0 }

    var value: Int {
        switch self {
        case .sr441: return 44_100
        case .sr480: return 48_000
        case .sr960: return 96_000
        case .sr192: return 192_000
        case .sr384: return 384_000
        }
    }

    var name: String {
        switch self {
        case .sr441: return "44.1"
        case .sr480: return "48"
        case .sr960: return "96"
        case .sr192: return "192"
        case .sr384: return "384"
        }
    }
}
