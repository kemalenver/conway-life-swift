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
    var worldSize: Size<Int>
    
    public init(_ size: Size<Int>) {
        
        self.worldSize = size
        self.world = Array(repeating: Array(repeating: Cell.dead, count: size.height), count: size.width)
    }
    
    public mutating func seed() {

//        world[4][4] = Cell.alive
//        world[4][5] = Cell.alive
//        world[4][6] = Cell.alive
        
//        world[3][5] = Cell.alive
//        world[5][5] = Cell.alive
        
        for x in 0..<worldSize.width {

            for y in 0..<worldSize.height {

                world[x][y] = arc4random_uniform(100) < 10 ? Cell.alive : Cell.dead
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

    func correctedPoint(_ x: Int, _ y: Int) -> Point {
        var x = x
        var y = y

        if x < 0 {
            x = x + worldSize.width
        } else if x > worldSize.width-1 {
            x = x - worldSize.width
        }

        if y < 0 {
            y = y + worldSize.height
        } else if y > worldSize.height-1 {
            y = y - worldSize.height
        }

        return Point(x, y)
    }

    subscript(x: Int, y: Int) -> Cell {
        
        get {
            
            let correctedPoint = self.correctedPoint(x, y)
            
            return world[correctedPoint.x][correctedPoint.y]
        }

        set {

            let correctedPoint = self.correctedPoint(x, y)
            
            world[correctedPoint.x][correctedPoint.y] = newValue
        }
    }
}
