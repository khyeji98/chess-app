//
//  Bishop.swift
//  ChessApp
//
//  Created by 김혜지 on 10/24/23.
//

protocol Bishop: Piece {}

extension Bishop {
    var score: Int { 3 }
    
    func movableCoordinates(at coordinate: Board.Coordinate) -> [Board.Coordinate] {
        var coordinates: [Board.Coordinate] = []
        
        var rankIncreaseAndDecreaseValue: Int = 0
        for fileRawValue in 0..<coordinate.file.rawValue {
            rankIncreaseAndDecreaseValue = 0
            
            guard let file = File(rawValue: fileRawValue) else { break }
            
            if let rank = Rank(rawValue: coordinate.rank.rawValue - rankIncreaseAndDecreaseValue) {
                coordinates.append((file, rank))
            }
            
            if let rank = Rank(rawValue: coordinate.rank.rawValue + rankIncreaseAndDecreaseValue) {
                coordinates.append((file, rank))
            }
            
            rankIncreaseAndDecreaseValue += 1
        }
        
        return coordinates
    }
}

struct BlackBishop: Bishop {
    var color: PieceColor { .black }
    var symbol: String { "♝" }
}

struct WhiteBishop: Bishop {
    var color: PieceColor { .white }
    var symbol: String { "♗" }
}
