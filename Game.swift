import Foundation
protocol Game {
    var text: String { get }
    var textArray: [String] { get }
    var atWord: Int { get set }
    var correctLetters: Int { get }
    var wrongLetters: Int { get }
    var timer: Timer { get }
    var seconds: Int { get }
    var wpm: Int { get }
    func calculateWPM()
    func start()
    func finish()
    func restart()
}
