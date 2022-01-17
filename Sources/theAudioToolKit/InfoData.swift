//
//  InfoData.swift
//  thunderTool v0.92
//
//  Created by thunderduck on 07/07/2021.
//

import Foundation

struct InfoResult {
    var value: String
    var unit: String
}

struct InfoData {

    enum Format {
        case bitRate
        case octet
        case byte
    }

    enum Mode: Int {
        case basic = 1000
        case info = 1024
    }

    private let bitRate = [" b/s", " kb/s", " Mb/s", " Gb/s", " Tb/s"]
    private let octet = [" o", " ko", " Mo", " Go", " To"]
    private let byte = [" B", " kB", " MB", " GB", " TB"]

    func getInfoResult(dataInBit: Int, format: Format, mode: Mode) -> InfoResult {

        var data = Double()
        if format != .bitRate {
            data = Double(dataInBit / 8)
        } else {
            data = Double(dataInBit)
        }

        var idx = 0
        while Int(data) > mode.rawValue && idx < 4 {
            data /= Double(mode.rawValue)
            idx += 1
        }

        let returnValue = String(format: "%.1f", data)
        var returnUnit = ""
        switch format {
        case .bitRate : returnUnit = bitRate[idx]
        case .octet : returnUnit =  octet[idx]
        case .byte : returnUnit =  byte[idx]
        }
        return InfoResult(value: returnValue, unit: returnUnit)
    }
}
