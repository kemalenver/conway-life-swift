import Foundation

public struct Size<T: Comparable> {

    public var width: T
    public var height: T

    public init(_ width: T, _ height: T) {
        self.width = width
        self.height = height
    }
}
