import Foundation
import UIKit

public protocol Grid {
    
    associatedtype T
    
    func cell(at index: (x: Int, y: Int)) -> T
    mutating func setCell(_ cell: T, at index: (x: Int, y: Int))
}
