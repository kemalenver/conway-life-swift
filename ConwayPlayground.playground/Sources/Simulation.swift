import Foundation
import UIKit

public class Simulation {
    
    var world: World
    public var size: (width: Int, height: Int)
    
    public init(with size: (width: Int, height: Int)) {
        self.size = size
        self.world = World(size)
    }
    
    public func start() {
        
//        print(self.world.description())

//        Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { timer in
//            print("Timer Fired at: \(timer.fireDate)")
//        }
    }
    
    @objc public func tick() {
        
        print("Tickng")
    }
    
    public func cell(at index: (x: Int, y: Int)) -> Cell {
        return world.cell(at: index)
    }
}
