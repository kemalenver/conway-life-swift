import Foundation
import UIKit

public class Simulation {
    
    var world: World
    var aliveCells = Set<Point>()
    
    public var size: Size<Int>
    
    public init(with size: Size<Int>) {
        
        self.size = size
        self.world = World(size)
        self.world.seed()
    }
    
    public func tick() {

        aliveCells.removeAll()
        
        var tempWorld = World(self.size)
        
        for x in 0..<size.width {

            for y in 0..<size.height {

                let n = self.numberOfAliveCells(around: Point(x,y))

                if (n == 3) || (n == 2 && world[x, y].isAlive) {
                    tempWorld[x, y] = Cell.alive
                    aliveCells.insert( Point(x,y) )
                } else {
                    tempWorld[x, y] = Cell.dead
                }
            }
        }

        self.world = tempWorld
    }
    
    
    public func numberOfAliveCells(around point: Point) -> Int {
        
        var n = 0;
        
        for x1 in (point.x-1)...(point.x+1) {
            
            for y1 in (point.y-1)...(point.y+1) {
                
                if world[x1, y1].isAlive {
                    n += 1
                }
            }
        }
        
        if world[point.x, point.y].isAlive {
            n -= 1
        }
        
        return n
    }
}
