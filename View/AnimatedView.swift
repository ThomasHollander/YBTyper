import UIKit
class AnimatedView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        generateBubbles(8)
        animateBubbles()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func generateBubbles(_ number:Int){
        var i = 0
        let x = self.frame.origin.x 
        let y = self.frame.origin.y
        let w = self.frame.width
        let h = self.frame.height
        while self.subviews.count != number {
            let origin = Random.generatePoint(min: CGPoint(x: x, y: y), max: CGPoint(x: w, y: h))
            if self.subviews.isEmpty {
                var bool = true
                for circle in self.subviews{
                    if circle.center.distance(origin) < CGFloat(UIScreen.main.bounds.height * 0.1){
                        bool = false
                        break
                    }
                }
                if(!bool){
                    continue
                } else {
                    self.addSubview(generateBubble(origin: origin))
                }
            } else {
                self.addSubview(generateBubble(origin: origin))
                i += 1
            }
        }
    }
    func generateBubble(origin: CGPoint) -> UILabel {
        let bubble = LabelView()
        bubble.frame.origin = origin
        return bubble
    }
    func animateBubbles() {
        for bubble in self.subviews {
            self.animate(bubble, xRandomizer: Random.generateCGFloat(0, 1.5), yRandomizer: Random.generateCGFloat(0, 1.5))
        }
    }
}
extension AnimatedView: Animatable {
    func animate(_ view: UIView, xRandomizer: CGFloat, yRandomizer: CGFloat) {
        let path = createBezierPath()
        let anim = CAKeyframeAnimation(keyPath: "position")
        anim.path = path.cgPath
        anim.rotationMode = nil
        anim.repeatCount = Float.infinity
        anim.duration = 45
        anim.speed = 0.7
        view.layer.add(anim, forKey: "animate position along path")
    }
}
