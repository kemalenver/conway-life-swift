//: Playground - noun: a place where people can play

import Foundation
import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let simulationSize = Size(50, 50)

let simulation = Simulation(with: simulationSize)

var containerView = Canvas(frame: CGRect(x: 0, y: 0, width: 800, height: 800), simulation: simulation)

PlaygroundPage.current.liveView = containerView

let timer = Timer.scheduledTimer(withTimeInterval: 0.0, repeats: true) { timer in

    simulation.tick()
    
    containerView.display()
}

