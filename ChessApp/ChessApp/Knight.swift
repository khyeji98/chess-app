//
//  Knight.swift
//  ChessApp
//
//  Created by 김혜지 on 10/25/23.
//

protocol Knight: Piece {}

extension Knight {
    var score: Int { 3 }
    
    func _movableCoordinates(from coordinate: Board.Coordinate) -> [Board.Coordinate] {
        var coordinates: [Board.Coordinate] = []
        
        if let twoUpRank = Rank(rawValue: coordinate.rank.rawValue + 2 ) {
            let result = searchMovableCoordinates(atRank: twoUpRank, bothSidesOfFile: coordinate.file)
            coordinates.append(contentsOf: result)
        }
        
        if let twoDownRank = Rank(rawValue: coordinate.rank.rawValue - 2) {
            let result = searchMovableCoordinates(atRank: twoDownRank, bothSidesOfFile: coordinate.file)
            coordinates.append(contentsOf: result)
        }
        
        if let twoLeftFile = File(rawValue: coordinate.file.rawValue - 2) {
            let result = searchMovableCoordinates(atFile: twoLeftFile, bothSidesOfRank: coordinate.rank)
            coordinates.append(contentsOf: result)
        }
        
        if let twoRightFile = File(rawValue: coordinate.file.rawValue + 2) {
            let result = searchMovableCoordinates(atFile: twoRightFile, bothSidesOfRank: coordinate.rank)
            coordinates.append(contentsOf: result)
        }
        
        return coordinates
    }
    
    private func searchMovableCoordinates(atRank rank: Rank, bothSidesOfFile file: File) -> [Board.Coordinate] {
        var coordinates: [Board.Coordinate] = []
        
        if let leftFile = File(rawValue: file.rawValue - 1) {
            coordinates.append((leftFile, rank))
        }
        
        if let rightFile = File(rawValue: file.rawValue + 1) {
            coordinates.append((rightFile, rank))
        }
        
        return coordinates
    }
    
    private func searchMovableCoordinates(atFile file: File, bothSidesOfRank rank: Rank) -> [Board.Coordinate] {
        var coordinates: [Board.Coordinate] = []
        
        if let upRank = Rank(rawValue: rank.rawValue + 1) {
            coordinates.append((file, upRank))
        }
        
        if let downRank = Rank(rawValue: rank.rawValue - 1) {
            coordinates.append((file, downRank))
        }
        
        return coordinates
    }
}

struct BlackKnight: Knight {
    var color: PieceColor { .black }
    var symbol: String { "♞" }
}

struct WhiteKnight: Knight {
    var color: PieceColor { .white }
    var symbol: String { "♘" }
}
