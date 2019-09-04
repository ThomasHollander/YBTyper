import Foundation
extension Float {
    static var random: Float {
        return Float(arc4random()) / 0xFFFFFFFF
    }
}
