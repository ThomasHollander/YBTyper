import Foundation
protocol Reusable {
    var identifier: String { get }
}
extension Reusable {
    var identifier: String {
        return String(describing: self)
    }
}
