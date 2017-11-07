//: Playground - noun: a place where people can play

import Foundation
import UIKit
import PlaygroundSupport

//PlaygroundPage.current.needsIndefiniteExecution = true

let simulationSize = (width: 80, height: 80)

let simulation = Simulation(with: simulationSize)

simulation.start()

let containerView = Canvas(frame: CGRect(x: 0, y: 0, width: 500, height: 500), simulation: simulation)

PlaygroundPage.current.liveView = containerView
