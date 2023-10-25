//
//  BoardMaker.swift
//  ChessApp
//
//  Created by 김혜지 on 10/15/23.
//

struct BoardMaker {
    static func make() -> [Rank: [File: Piece?]] {
        var squares: [Rank: [File: Piece?]] = [:]
        
        for rank in Rank.allCases {
            var squaresPerRank: [File: Piece?] = [:]
            
            for file in File.allCases {
                let piece = _piece(at: (file, rank))
                squaresPerRank.updateValue(piece, forKey: file)
            }
            
            squares.updateValue(squaresPerRank, forKey: rank)
        }
        
        return squares
    }
    
    private static func _piece(at coordinate: Board.Coordinate) -> Piece? {
        switch coordinate.rank {
        case .one:
            switch coordinate.file {
            case .a, .h:
                return BlackRook()
            case .b, .g:
                return BlackKnight()
            case .c, .f:
                return BlackBishop()
            case .e:
                return BlackQueen()
            default:
                return nil
            }
        case .two:
            return BlackPawn()
        case .seven:
            return WhitePawn()
        case .eight:
            switch coordinate.file {
            case .a, .h:
                return WhiteRook()
            case .b, .g:
                return WhiteKnight()
            case .c, .f:
                return WhiteBishop()
            case .e:
                return WhiteQueen()
            default:
                return nil
            }
        default:
            return nil
        }
    }
}
