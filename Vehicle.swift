import Foundation
class Vehicle {
    var fullImage: String
    var iconImages: [String]
    var name: String
    init(fullImage: String, iconImages: [String], name: String) {
        self.fullImage = fullImage
        self.iconImages = iconImages
        self.name = name
    }
}
