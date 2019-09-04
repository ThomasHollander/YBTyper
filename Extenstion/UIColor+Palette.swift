import UIKit
extension UIColor {
    static let catalinaBlue = "2DAD6D".hexColor
    static let dodgerBlue = "44A1FF".hexColor
    static let deepSkyBlue = "79CFFF".hexColor
    static let silverGray = "BEBEBE".hexColor
    static let candyAppleRed = "ED9D16".hexColor
    static let appleGreen = "73E0AE".hexColor
    static func random() -> UIColor {
        return UIColor(red:   .randomColor(),
                       green: .randomColor(),
                       blue:  .randomColor(),
                       alpha: 1.0)
    }
}
