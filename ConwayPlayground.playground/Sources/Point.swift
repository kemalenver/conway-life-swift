import Foundation

public struct Point {

    var x: Int
    var y: Int
    
    init(_ x: Int, _ y: Int) {
        self.x = x
        self.y = y
    }
}

extension Point: Hashable {

    public var hashValue: Int {
        return (53 + x.hashValue) * 53 + y.hashValue
    }

    public static func == (lhs: Point, rhs: Point) -> Bool {
        return lhs.x == rhs.x && lhs.y == rhs.y
    }
}
