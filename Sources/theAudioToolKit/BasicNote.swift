//
//  Note.swift
//  thunderTool v0.92
//
//  Created by thunderduck on 16/06/2021.
//

import Foundation

struct BasicNote {

    private let ratio: Float = 1.059463

    private var rootNote: RootNote
    public var octave: Octave
    private var tuning: TuningFrequencyForA4

    init(rootNote: RootNote, octave: Octave, tuning: TuningFrequencyForA4) {
        self.rootNote = rootNote
        self.octave = octave
        self.tuning = tuning
    }

    public var name: String {
        switch rootNote {
        case .cFlat:    return NSLocalizedString("C", comment: "BasicNote: name for C")
        case .cSharp:   return NSLocalizedString("C# / Db", comment: "BasicNote: name for C# / Db")
        case .dFlat:    return NSLocalizedString("D", comment: "BasicNote: name for D")
        case .dSharp:   return NSLocalizedString("D# / Eb", comment: "BasicNote: name for D# / Eb")
        case .eFlat:    return NSLocalizedString("E", comment: "BasicNote: name for E")
        case .fFlat:    return NSLocalizedString("F", comment: "BasicNote: name for F")
        case .fSharp:   return NSLocalizedString("F# / Gb", comment: "BasicNote: name for F# / Gb")
        case .gFlat:    return NSLocalizedString("G", comment: "BasicNote: name for G")
        case .gSharp:   return NSLocalizedString("G# / Ab", comment: "BasicNote: name for G# / Ab")
        case .aFlat:    return NSLocalizedString("A", comment: "BasicNote: name for A")
        case .aSharp:   return NSLocalizedString("A# / Bb", comment: "BasicNote: name for A# / Bb")
        case .bFlat:    return NSLocalizedString("B", comment: "BasicNote: name for B")
        }
    }

    enum RootNote: Int, CaseIterable {
        case cFlat  = 1
        case cSharp = 2
        case dFlat  = 3
        case dSharp = 4
        case eFlat  = 5
        case fFlat  = 6
        case fSharp = 7
        case gFlat  = 8
        case gSharp = 9
        case aFlat  = 10
        case aSharp = 11
        case bFlat  = 12
    }

    enum Octave: Int, CaseIterable {
        case oct0 = 0
        case oct1 = 1
        case oct2 = 2
        case oct3 = 3
        case oct4 = 4
        case oct5 = 5
        case oct6 = 6
        case oct7 = 7
        case oct8 = 8
        case oct9 = 9
        case oct10 = 10
    }

    enum TuningFrequencyForA4: Float {
        case hz438 = 438.00
        case hz440 = 440.00
        case hz442 = 442.00
        case hz444 = 444.00

        var octaveRef: Octave {
            return .oct4
        }
    }

    var frequencyHz: Int {
        let octaveDelta = tuning.octaveRef.rawValue - self.octave.rawValue
        let interval = -(RootNote.aFlat.rawValue - self.rootNote.rawValue) - octaveDelta*12
        let powww = pow(self.ratio, Float(interval))
        let result = self.tuning.rawValue * powww
        return Int(round(result))
    }

}

class BasicRootNotes {

    public var rootNotes = [BasicNote]()

    init(tuning: BasicNote.TuningFrequencyForA4) {
        for octave in BasicNote.Octave.allCases {
            for note in BasicNote.RootNote.allCases {
                let newNote = BasicNote(rootNote: note, octave: octave, tuning: tuning)
                rootNotes.append(newNote)
            }
        }
    }

    // Return an array of 2 BasicNote closest to frequency 
    public func findNote(from freq: Int) -> [BasicNote] {
        var dwnDeltaHz = freq - rootNotes[0].frequencyHz
        var dwnLastNote = rootNotes[0]
        var upLastNote = rootNotes[0]

        for idx in 0..<rootNotes.count {
            if abs(freq - rootNotes[idx].frequencyHz) < dwnDeltaHz {
                dwnDeltaHz = freq - rootNotes[idx].frequencyHz
                dwnLastNote = rootNotes[idx]

                if idx+1 < rootNotes.count {
                    upLastNote = rootNotes[idx+1]
                }
            }
        }
        var rtn = [BasicNote]()
        rtn.append(dwnLastNote)
        rtn.append(upLastNote)

        return rtn
    }

}
