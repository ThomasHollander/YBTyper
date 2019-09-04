import UIKit
import Cartography
class SettingsTableViewCell: UITableViewCell {
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont(name: "Avenir-Next", size: Constant.multiplyToWidth(number: 16))
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        titleLabel.textColor = .white
        return titleLabel
    }()
    lazy var cellIcon: UIImageView = {
        let cellIcon = UIImageView()
        cellIcon.layer.shadowColor = UIColor.black.cgColor
        cellIcon.layer.shadowOpacity = 0.07
        cellIcon.layer.shadowOffset = CGSize(width: Constant.multiplyToHeight(number: 1), height: Constant.multiplyToHeight(number: 1))
        cellIcon.layer.shadowRadius = Constant.multiplyToHeight(number: 3)
        cellIcon.contentMode = .scaleAspectFill
        return cellIcon
    }()
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        configureViews()
        configureConstraints()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configureViews(){
        [titleLabel, cellIcon].forEach({contentView.addSubview($0)})
    }
    func configureConstraints(){
        constrain(titleLabel, cellIcon, contentView) { tl, ci, sf in
            ci.centerY == sf.centerY
            ci.width == Constant.multiplyToWidth(number: 24)
            ci.height == Constant.multiplyToHeight(number: 24)
            ci.left == sf.left + Constant.multiplyToWidth(number: 15)
            tl.centerY == sf.centerY
            tl.left == ci.right + Constant.multiplyToWidth(number: 20)
        }
    }
}
