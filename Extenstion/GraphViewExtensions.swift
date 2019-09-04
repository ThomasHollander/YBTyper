import Foundation
import ScrollableGraphView
extension LinePlot {
    func setLineStyle(){
        self.adaptAnimationType = .easeOut
        self.lineStyle = .straight
    }
}
extension DotPlot {
    func setDotStyle(){
        self.dataPointType = .circle
        self.dataPointSize = Constant.multiplyToHeight(number: 5)
    }
}
extension ReferenceLines {
    func setReferenceStyle(){
        self.referenceLineLabelFont = .boldSystemFont(ofSize: Constant.multiplyToWidth(number: 8))
        self.referenceLineLabelFont = .boldSystemFont(ofSize: Constant.multiplyToWidth(number: 8))
        self.referenceLineColor = UIColor.white.withAlphaComponent(0.2)
        self.referenceLineLabelColor = .white
        self.relativePositions = [0, 0.2, 0.4, 0.6, 0.8, 1]
        self.dataPointLabelColor = UIColor.white.withAlphaComponent(1)
    }
}
extension ScrollableGraphView {
    func setGraphStyle(){
        self.backgroundFillColor = .catalinaBlue
        self.dataPointSpacing = Constant.multiplyToWidth(number: 60)
        self.shouldAnimateOnStartup = true
        self.shouldAdaptRange = true
        self.shouldRangeAlwaysStartAtZero = true
    }
}
