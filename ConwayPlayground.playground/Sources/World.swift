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

public struct World{
    
    
    var world: [[Cell]]
    var worldSize: (height: Int, width: Int)
    
    public init(_ dimensions: (width: Int, height: Int)) {
        
        self.worldSize = dimensions
        self.world = Array(repeating: Array(repeating: Cell.dead, count: dimensions.height), count: dimensions.width)
    }
    
    public mutating func seed() {

//        world[4][4] = Cell.alive
//        world[4][5] = Cell.alive
//        world[4][6] = Cell.alive
        
//        world[3][5] = Cell.alive
//        world[5][5] = Cell.alive
        
        for x in 0..<worldSize.width {

            for y in 0..<worldSize.height {

                world[x][y] = arc4random_uniform(100) < 15 ? Cell.alive : Cell.dead
            }
        }
    }
    
    public mutating func glider() {
        
        world[3][6] = Cell.alive
        
        world[4][4] = Cell.alive
        world[4][5] = Cell.alive
        
        world[5][5] = Cell.alive
        world[5][6] = Cell.alive
    }
    
    public mutating func seed2() {
        
                world[4][4] = Cell.alive
                world[5][4] = Cell.alive
                world[6][4] = Cell.alive
        
        world[5][5] = Cell.alive
        world[6][5] = Cell.alive
        world[7][5] = Cell.alive
        
        //        world[3][5] = Cell.alive
        //        world[5][5] = Cell.alive
        
        
    }
    
    subscript(x: Int, y: Int) -> Cell {
        
        get {
            
            var x = x
            var y = y
            
            if x < 0 {
                x = x + worldSize.width
            }
            
            if x > worldSize.width-1 {
                x = x - worldSize.width
            }
            
            if y < 0 {
                
                y = y + worldSize.height
            }
            
            if y > worldSize.height-1 {
                y = y - worldSize.height
            }
            
            return world[x][y]
        }
        set {
            var x = x
            var y = y
            
            if x < 0 {
                x = x + worldSize.width
            }
            
            if x > worldSize.width-1 {
                x = x - worldSize.width
            }
            
            if y < 0 {
                
                y = y + worldSize.height
            }
            
            if y > worldSize.height-1 {
                y = y - worldSize.height
            }
            
            world[x][y] = newValue
        }
    }
}
