//
//  Board.swift
//  ChessApp
//
//  Created by 김혜지 on 10/15/23.
//

struct Board {
    typealias Coordinate = (file: File, rank: Rank)
    typealias Squares = [[Piece?]]
    
    private var currentTurnColor: PieceColor
    private var scores: [PieceColor: Int]
    private var squares: Squares
    
    init(currentTurnColor: PieceColor = .white, scores: [PieceColor : Int] = [:], squares: Squares = BoardMaker.make()) {
        self.currentTurnColor = currentTurnColor
        self.scores = scores
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
        guard let piece = self.squares[coordinate.rank.rawValue][coordinate.file.rawValue] else { return [] }
        guard piece.color == self.currentTurnColor else { return [] }
        let movableCoordinates = piece.movableCoordinates(at: coordinate).filter { file, rank in
            let piece = self.squares[rank.rawValue][file.rawValue]
            return piece?.color != self.currentTurnColor
        }
        return movableCoordinates
    }
    
    mutating func move(from currentCoordinate: Coordinate, to targetCoordinate: Coordinate) -> Bool {
        guard let currentPiece = self.squares[currentCoordinate.rank.rawValue][currentCoordinate.file.rawValue] else { return false }
        guard let targetPiece = self.squares[targetCoordinate.rank.rawValue][targetCoordinate.file.rawValue] else {
            self.squares[targetCoordinate.rank.rawValue][targetCoordinate.file.rawValue] = currentPiece
            self.squares[currentCoordinate.rank.rawValue][currentCoordinate.file.rawValue] = nil
            self.switchTurn()
            return true
        }
        
        guard targetPiece.color != currentPiece.color else { return false }
        self.squares[targetCoordinate.rank.rawValue][targetCoordinate.file.rawValue] = currentPiece
        self.squares[currentCoordinate.rank.rawValue][currentCoordinate.file.rawValue] = nil
        self.score(points: targetPiece.points)
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
    
    mutating func score(points: Int) {
        let score = self.scores[self.currentTurnColor] ?? 0
        self.scores.updateValue(score + points, forKey: self.currentTurnColor)
    }
    
    func display() -> String {
        self.squares.map({ $0.map({ $0?.symbol ?? "." }).joined()}).joined(separator: "\n")
    }
}
