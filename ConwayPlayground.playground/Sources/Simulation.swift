import Foundation
import UIKit

public class Simulation {
    
    var world: World
    var aliveCells = [(x: Int, y: Int)]()
    
    public var size: (width: Int, height: Int)
    
    public init(with size: (width: Int, height: Int)) {
        
        self.size = size
        self.world = World(size)
        self.world.seed()
    }
    
    public func tick() {
        
        let tempAliveCells = aliveCells
        
        aliveCells.removeAll()
        
        var tempWorld = World(self.size)
        
        for x in 0..<size.width {

            for y in 0..<size.height {

                let n = self.numberOfAliveCells(around: (x: x, y: y))

                if (n == 3) || (n == 2 && world[x, y].isAlive) {
                    tempWorld[x, y] = Cell.alive
                    aliveCells.append( (x:x, y:y) )
                } else {
                    tempWorld[x, y] = Cell.dead
                }
            }
        }

        self.world = tempWorld
    }
    
    
    public func numberOfAliveCells(around index: (x: Int, y: Int)) -> Int {
        
        var n = 0;
        
        for x1 in (index.x-1)...(index.x+1) {
            
            for y1 in (index.y-1)...(index.y+1) {
                
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
