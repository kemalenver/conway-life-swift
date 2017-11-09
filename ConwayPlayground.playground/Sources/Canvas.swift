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

    
    override public func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let simulationSize = simulation.size
        
        let incrementX = rect.width / CGFloat(simulationSize.width)
        let incrementY = rect.width / CGFloat(simulationSize.height)
        
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        drawSimulation(in: context, with: CGSize(width: incrementX, height: incrementY))
        
        context.setLineWidth(1.0)
        context.setStrokeColor(UIColor.darkGray.cgColor)
        
        // Draw verticals
        for x in stride(from: CGFloat(0), through: rect.size.width, by: incrementX) {
        
            context.move(to: CGPoint(x: x, y: 0))
            context.addLine(to: CGPoint(x: x, y: rect.height))
            context.strokePath()
            
        }
        
        // Draw horizontals
        for y in stride(from: CGFloat(0), through: rect.size.height, by: incrementY) {
            
            context.move(to: CGPoint(x: 0, y: y))
            context.addLine(to: CGPoint(x: rect.width, y: y))
            context.strokePath()
            
        }
        
    }
    
    func drawSimulation(in context: CGContext, with size: CGSize) {
        
        context.setFillColor(UIColor.red.cgColor)
        for x in 0..<simulation.size.width {
            
            for y in 0..<simulation.size.height {
                
                let cell = simulation.world[x, y]
                
                if cell.isAlive {
                
                    let rect = CGRect(x: CGFloat(x) * size.width, y: CGFloat(y) * size.height, width: size.width, height: size.height)
                    
                    context.fill(rect)
                }
            }
        }
        
        
    }
}
