//
//  Pawn.swift
//  ChessApp
//
//  Created by 김혜지 on 10/16/23.
//

struct BlackPawn: Piece {
    var color: PieceColor { .black }
    var symbol: String { "♟" }
    var score: Int { 1 }
    
    func movableCoordinates(at coordinate: Board.Coordinate) -> [Board.Coordinate] {
        guard let nextRank = Rank(rawValue: coordinate.rank.rawValue + 1) else { return [] }
        return [(coordinate.file, nextRank)]
    }
}

struct WhitePawn: Piece {
    var color: PieceColor { .white }
    var symbol: String { "♙" }
    var score: Int { 1 }
    
    func movableCoordinates(at coordinate: Board.Coordinate) -> [Board.Coordinate] {
        guard let nextRank = Rank(rawValue: coordinate.rank.rawValue - 1) else { return [] }
        return [(coordinate.file, nextRank)]
    }
}
