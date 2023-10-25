//
//  Queen.swift
//  ChessApp
//
//  Created by 김혜지 on 10/23/23.
//

protocol Queen: Piece {}

extension Queen {
    var score: Int { 9 }
    
    func _movableCoordinates(from coordinate: Board.Coordinate) -> [Board.Coordinate] {
        var coordinates: [Board.Coordinate] = []
        
        let sideCoordinates = _movableSideCoordinates(from: coordinate)
        let upDownCoordinates = _movableUpDownCoordinates(from: coordinate)
        let diagonalCoordinates = _movableDiagonalCoordinates(from: coordinate)
        
        return coordinates
    }
    
    private func _movableSideCoordinates(from coordinate: Board.Coordinate) -> [Board.Coordinate] {
        File.allCases.filter({ $0 != coordinate.file }).map({ ($0, coordinate.rank) })
    }
    
    private func _movableUpDownCoordinates(from coordinate: Board.Coordinate) -> [Board.Coordinate] {
        Rank.allCases.filter({ $0 != coordinate.rank }).map({ (coordinate.file, $0) })
    }
    
    private func _movableDiagonalCoordinates(from coordinate: Board.Coordinate) -> [Board.Coordinate] {
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

struct BlackQueen: Queen {
    var color: PieceColor { .black }
    var symbol: String { "♛" }
}

struct WhiteQueen: Queen {
    var color: PieceColor { .black }
    var symbol: String { "♕" }
}
