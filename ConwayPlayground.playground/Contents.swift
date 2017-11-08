//: Playground - noun: a place where people can play

import Foundation
import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let simulationSize = (width: 50, height: 50)

var containerView:  Canvas?

let simulation = Simulation(with: simulationSize) {
    
    guard let containerView = containerView else {
        return
    }
    containerView.setNeedsDisplay()
}

containerView = Canvas(frame: CGRect(x: 0, y: 0, width: 500, height: 500), simulation: simulation)

PlaygroundPage.current.liveView = containerView

simulation.start()
