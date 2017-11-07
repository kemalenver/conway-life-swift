import Foundation
import UIKit

public enum GridPosition {
    case top
    case right
    case bottom
    case left
    case topRight
    case bottomRight
    case bottomLeft
    case topLeft
}

public protocol Grid {
    
    associatedtype T
    
    func surroundingElements() -> [T]
    func item(at position: GridPosition) -> T?
    func cell(at index: (x: Int, y: Int)) -> T
}
