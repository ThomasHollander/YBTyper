

import UIKit

class CustomBaseView: UIView {

    var RootBase01: UIButton!
    var RootBase02: UIButton!
    var RootBase03: UIButton!
    var RootBase04: UIButton!
    
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override func layoutSubviews() {
        super.layoutSubviews()
        let barwidth = UIScreen.main.bounds.size.width/4

         RootBase01.frame = CGRect(x:(barwidth-44)/2, y:0, width:44, height:44)
         RootBase01.setImage(UIImage.init(named: "icon-shouye"), for: .normal)
         RootBase02.frame = CGRect(x:barwidth + (barwidth-44)/2, y:0, width:44, height:44)
         RootBase02.setImage(UIImage.init(named: "icon-refresh"), for: .normal)
         RootBase03.frame = CGRect(x:2 * barwidth + (barwidth-44)/2, y:0, width:44, height:44)
         RootBase03.setImage(UIImage.init(named: "icon-xiangzuo"), for: .normal)
         RootBase04.frame = CGRect(x:3 * barwidth + (barwidth-44)/2, y:0, width:44, height:44)
         RootBase04.setImage(UIImage.init(named: "icon-xiangyou"), for: .normal)

    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        RootBase01 = UIButton()
        self.addSubview(RootBase01)
        RootBase02 = UIButton()
        self.addSubview(RootBase02)
        RootBase03 = UIButton()
        self.addSubview(RootBase03)
        RootBase04 = UIButton()
        self.addSubview(RootBase04)
        self.backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
  
}
