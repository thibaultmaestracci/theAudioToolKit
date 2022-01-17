//
//  MultiTrack.swift
//  thunderTool v0.92
//
//  Created by thunderduck on 10/05/2021.
//

import Foundation

public struct MultiTrack {
    // MARK: - Private

    private var sampleRate: SampleRates
    private var bitDepth: BitDepths
    private var tracks: Int
    private var time: Int!         // minutes

    private var bitrate: Int {
        return sampleRate.value * bitDepth.value * tracks
    }

    private var size: Int {
        return bitrate * time * 60
    }

    private var monoSize: Int {
        return sampleRate.value * bitDepth.value * time * 60
    }

    public init(_ sampleRate: SampleRates = .sr441, _ bitDepth: BitDepths = .bd16, _ tracks: Int = 1, _ time: Int = 1) {
        self.sampleRate = sampleRate
        self.bitDepth = bitDepth
        self.tracks = tracks
        self.time = time
    }

    // MARK: - Public

    public func getTimeFormated() -> String {
        let hours = time / 60
        let min = time % 60
        return "\(hours) h \(min) m"
    }

    public func getBitRate() -> InfoResult {
        let infoData = InfoData()
        return infoData.getInfoResult(dataInBit: bitrate, format: .bitRate, mode: .basic)
    }

    public func getSize() -> InfoResult {
        let infoData = InfoData()
        return infoData.getInfoResult(dataInBit: size, format: .octet, mode: .basic)
    }

    public func getMonoSize() -> InfoResult {
        let infoData = InfoData()
        return infoData.getInfoResult(dataInBit: monoSize, format: .octet, mode: .basic)
    }

    public func warning() -> Bool {
        return !( isvalid(inter: .fw400) && isfat32valid() )
    }

    public func isvalid(inter: Interfaces) -> Bool {
        return bitrate <= inter.rawValue
    }

    public func isfat32valid() -> Bool {
        let fat32limit = 4_000_000_000 * 8
        return monoSize < fat32limit
    }
}
