//
//  SoundSpeed.swift
//  thunderTool
//
//  Created by thunderduck on 07/07/2021.
//

import Foundation

enum SoundSpeeds: Int, CaseIterable {
    case ss00c = 0
    case ss10c
    case ss15c
    case ss20c
    case ss30c

    static var defaultIndexValue: Int { 2 }

    var value: Int {
        switch self {
        case .ss00c: return 331
        case .ss10c: return 337
        case .ss15c: return 340
        case .ss20c: return 343
        case .ss30c: return 349
        }
    }

    var name: String {
        switch self {
        case .ss00c: return "0°c"
        case .ss10c: return "10°c"
        case .ss15c: return "15°c"
        case .ss20c: return "20°c"
        case .ss30c: return "30°c"
        }
    }
}