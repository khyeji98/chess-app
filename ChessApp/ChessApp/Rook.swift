//
//  Rook.swift
//  ChessApp
//
//  Created by 김혜지 on 10/25/23.
//

protocol Rook: Piece {}

extension Rook {
    var score: Int { 5 }
    
    func _movableCoordinates(from coordinate: Board.Coordinate) -> [Board.Coordinate] {
        var coordinates: [Board.Coordinate] = []
        
        for rank in Rank.allCases where rank != coordinate.rank {
            coordinates.append((coordinate.file, rank))
        }
        
        for file in File.allCases where file != coordinate.file {
            coordinates.append((file, coordinate.rank))
        }
        
        return coordinates
    }
}

struct BlackRook: Rook {
    var color: PieceColor { .black }
    var symbol: String { "♜" }
}

struct WhiteRook: Rook {
    var color: PieceColor { .white }
    var symbol: String { "♖" }
}
