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
        
        world = World.seedWorld(dimensions)
    }
    
    private static func seedWorld(_ dimensions: (height: Int, width: Int)) -> [[Cell]] {
        
        var world = Array(repeating: Array(repeating: Cell.dead, count: dimensions.height), count: dimensions.width)
        
        for i in 0..<dimensions.height {
            
            for j in 0..<dimensions.width {
                
                world[i][j] = arc4random_uniform(20) == 0 ? Cell.alive : Cell.dead
            }
        }
        
        return world
    }
    
    public func surroundingElements() -> [Cell] {
        
        return [Cell.alive]
    }
    
    public func item(at position: GridPosition) -> Cell? {
        return nil
    }
    
    public func cell(at index: (x: Int, y: Int)) -> Cell {
        return world[index.x][index.y]
    }
    
    public func description() -> String {
        
        var descriptionString = ""
        
        for i in 0..<worldSize.height {
            for j in 0..<worldSize.width {
                descriptionString += world[i][j].description
            }
            descriptionString += "\n"
        }
        
        return descriptionString
    }
}
