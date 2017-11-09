import Foundation
import UIKit

public class Canvas: UIView {
    
    var simulation: Simulation
    
    public init(frame: CGRect, simulation: Simulation) {
        
        self.simulation = simulation
        
        super.init(frame: frame)
        
        self.backgroundColor = .white
    }
    
    @available(*, unavailable) public required init?(coder aDecoder: NSCoder) {
        fatalError("disabled init")
    }
    
    func drawSimulation(in context: CGContext, with size: CGSize) {
        
        context.setFillColor(UIColor.red.cgColor)
        
        for point in simulation.aliveCells {
            
            let rect = CGRect(x: CGFloat(point.x) * size.width, y: CGFloat(point.y) * size.height, width: size.width, height: size.height)
            
            context.fill(rect)
        }
    }
    
    public func display() {
        let layer = self.layer
        layer.setNeedsDisplay()
        layer.displayIfNeeded()
    }
    
    
    override public func draw(_ layer: CALayer, in ctx: CGContext) {
     
        super.draw(layer, in: ctx)
        
        let rect = self.bounds
        
        let simulationSize = simulation.size
        
        let incrementX = rect.width / CGFloat(simulationSize.width)
        let incrementY = rect.width / CGFloat(simulationSize.height)
        
        drawSimulation(in: ctx, with: CGSize(width: incrementX, height: incrementY))
        
        ctx.setLineWidth(1)
        ctx.setStrokeColor(UIColor.darkGray.cgColor)
        
        // Draw verticals
        for x in stride(from: CGFloat(0), through: rect.size.width, by: incrementX) {
            
            ctx.move(to: CGPoint(x: x, y: 0))
            ctx.addLine(to: CGPoint(x: x, y: rect.height))
            ctx.strokePath()
            
        }
        
        // Draw horizontals
        for y in stride(from: CGFloat(0), through: rect.size.height, by: incrementY) {
            
            ctx.move(to: CGPoint(x: 0, y: y))
            ctx.addLine(to: CGPoint(x: rect.width, y: y))
            ctx.strokePath()
            
        }
    }
}
