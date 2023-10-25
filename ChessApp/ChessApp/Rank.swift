//
//  Rank.swift
//  ChessApp
//
//  Created by 김혜지 on 10/15/23.
//

enum Rank: Int, CaseIterable, CustomStringConvertible {
    case one
    case two
    case three
    case four
    case five
    case six
    case seven
    case eight
    
    var description: String {
        switch self {
        case .one:
            return "1"
        case .two:
            return "2"
        case .three:
            return "3"
        case .four:
            return "4"
        case .five:
            return "5"
        case .six:
            return "6"
        case .seven:
            return "7"
        case .eight:
            return "8"
        }
    }
}
