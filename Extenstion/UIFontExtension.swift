import UIKit
extension UIFont {
    static func setCabinSketch(ofSize size: CGFloat) -> UIFont{
        if let font = UIFont(name: "CabinSketch-Bold", size: size){
            return font
        }
        return UIFont.systemFont(ofSize: size)
    }
}
