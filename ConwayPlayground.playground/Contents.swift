//: Playground - noun: a place where people can play

import Foundation
import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let simulationSize = (width: 200, height: 200)

let simulation = Simulation(with: simulationSize)

var containerView = Canvas(frame: CGRect(x: 0, y: 0, width: 800, height: 800), simulation: simulation)

PlaygroundPage.current.liveView = containerView

let timer = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true) { timer in

    DispatchQueue.main.async {

        simulation.tick()
        containerView.setNeedsDisplay()
    }

}

