import Foundation
import UIKit

public class Simulation {
    
    var world: World
    var ticked: (()->Void)?
    public var size: (width: Int, height: Int)
    
    public init(with size: (width: Int, height: Int), ticked:(()->Void)?) {
        self.size = size
        self.world = World(size)
        self.world.seed()
        self.ticked = ticked
    }
    
    public func start() {

        Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { timer in
            self.tick()
            self.ticked?()
        }
    }
    
    @objc public func tick() {
        
        let n = self.numberOfAliveCells(around: (x: 4, y: 5))
        print(n)
        
//        var tempWorld = World(size)
//
//        for x in 0..<size.width {
//
//            for y in 0..<size.height {
//
//                let n = self.numberOfAliveCells(around: (x: x, y: y))
//
//                let cell = (n == 3) || (n == 2 && world.cell(at:(x: x, y: y)).isAlive) ? Cell.alive : Cell.dead
//                tempWorld.setCell(cell, at: (x:x, y:y))
//            }
//        }
//
//        self.world = tempWorld
    }
    
    public func cell(at index: (x: Int, y: Int)) -> Cell {
        return world.cell(at: index)
    }
    
    public func numberOfAliveCells(around index: (x: Int, y: Int)) -> Int {
        
        var n = 0;
        
        for x1 in (index.x-1)..<(index.x+1) {
            
            for y1 in (index.y-1)..<(index.y+1) {
                
                let modX = (x1 + size.width) % size.width
                let modY = (y1 + size.height) % size.height
                
                if world.cell(at:(x: modX, y: modY)).isAlive {
                    n += 1
                }
            }
        }
        
        if world.cell(at:(x: index.x, y: index.y)).isAlive {
            n -= 1
        }
        
        return n
    }
    
    public func description() -> String {
        return self.world.description()
    }
}
