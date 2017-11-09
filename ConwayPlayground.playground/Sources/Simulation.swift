import Foundation
import UIKit

public class Simulation {
    
    var world: World
    
    public var size: (width: Int, height: Int)
    
    public init(with size: (width: Int, height: Int)) {
        
        print(size)
        
        self.size = size
        self.world = World(size)
        self.world.seed()
    }
    
    public func tick() {
        
        var tempWorld = World(self.size)

        for x in 0..<size.width {

            for y in 0..<size.height {

                let n = self.numberOfAliveCells(around: (x: x, y: y))

                let cell = (n == 3) || (n == 2 && world[x, y].isAlive) ? Cell.alive : Cell.dead

                tempWorld[x, y] = cell
            }
        }

        self.world = tempWorld
    }
    
    
    public func numberOfAliveCells(around index: (x: Int, y: Int)) -> Int {
        
        var n = 0;
        
        for x1 in (index.x-1)...(index.x+1) {
            
            for y1 in (index.y-1)...(index.y+1) {
//                print("checking: \(x1), \(y1)")
                
                if world[x1, y1].isAlive {
                    n += 1
                }
            }
        }
        
        if world[index.x, index.y].isAlive {
            n -= 1
        }
        
        return n
    }
}
