import Foundation
import UIKit

public enum Cell: CustomStringConvertible {
    
    case alive
    case dead
    
    public var description : String {
        switch self {
            
        case .alive: return "*"
        case .dead: return "o"
        }
    }
    
    public var isAlive: Bool {
    
        if case .alive = self {
            return true
        }
        return false
    }
}

public struct World: Grid {
    
    public typealias T = Cell
    
    var world: [[Cell]]
    var worldSize: (height: Int, width: Int)
    
    public init(_ dimensions: (height: Int, width: Int)) {
        
        self.worldSize = dimensions
        self.world = Array(repeating: Array(repeating: Cell.dead, count: dimensions.height), count: dimensions.width)
    }
    
    public mutating func seed() {

        world[4][4] = Cell.alive
        world[4][5] = Cell.alive
        world[4][6] = Cell.alive
        
        world[3][5] = Cell.alive
        world[5][5] = Cell.alive
        
//        for x in 0..<worldSize.width {
//
//            for y in 0..<worldSize.height {
//
//                world[x][y] = arc4random_uniform(20) == 0 ? Cell.alive : Cell.dead
//            }
//        }
    }
    
    public func cell(at index: (x: Int, y: Int)) -> Cell {
        return world[index.x][index.y]
    }
    
    mutating public func setCell(_ cell: Cell, at index: (x: Int, y: Int)) {
        world[index.x][index.y] = cell
    }
    
    public func description() -> String {
        
        var descriptionString = ""
        
        for x in 0..<worldSize.width {
            for y in 0..<worldSize.height {
                descriptionString += world[x][y].description
            }
            descriptionString += "\n"
        }
        
        return descriptionString
    }
}
