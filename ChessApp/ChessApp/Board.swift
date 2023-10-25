//
//  Board.swift
//  ChessApp
//
//  Created by 김혜지 on 10/15/23.
//

struct Board {
    typealias Coordinate = (file: File, rank: Rank)
    typealias Squares = [Rank: [File: Piece?]]
    
    private(set) var currentTurnColor: PieceColor
    private(set) var squares: Squares
    
    init(currentTurnColor: PieceColor = .white, squares: Squares = BoardMaker.make()) {
        self.currentTurnColor = currentTurnColor
        self.squares = squares
    }
    
    func verifyCoordinate(input: String) -> Coordinate? {
        let separatedInput = input.components(separatedBy: "")
        guard separatedInput.count == 2 else { return nil }
        guard let file = File(withDescription: separatedInput[0]) else { return nil }
        guard let rank = Rank(withDescription: separatedInput[1]) else { return nil }
        return (file, rank)
    }
    
    func searchMovableCoordinates(at coordinate: Coordinate) -> [Coordinate] {
        guard let piece = self.squares[coordinate.rank]?[coordinate.file] as? Piece else { return [] }
        guard piece.color == self.currentTurnColor else { return [] }
        return piece.movableCoordinates(at: coordinate)
    }
    
    mutating func move(from currentCoordinate: Coordinate, to targetCoordinate: Coordinate) -> Bool {
        guard let currentPiece = self.squares[currentCoordinate.rank]?[currentCoordinate.file] as? Piece else { return false }
        guard let targetPiece = self.squares[targetCoordinate.rank]?[targetCoordinate.file] as? Piece else {
            self.squares[targetCoordinate.rank]?[targetCoordinate.file] = currentPiece
            self.squares[currentCoordinate.rank]?[currentCoordinate.file] = nil
            self.switchTurn()
            return true
        }
        
        guard targetPiece.color != currentPiece.color else { return false }
        self.squares[targetCoordinate.rank]?[targetCoordinate.file] = currentPiece
        self.squares[currentCoordinate.rank]?[currentCoordinate.file] = nil
        self.switchTurn()
        return true
    }
    
    mutating func switchTurn() {
        switch self.currentTurnColor {
        case .black:
            self.currentTurnColor = .white
        case .white:
            self.currentTurnColor = .black
        }
    }
}
