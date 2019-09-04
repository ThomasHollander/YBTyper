import UIKit
import Cartography
class SettingsViewController: UIViewController, Reusable {
    var items = SettingItem.list
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Settings"
        label.textColor = .white
        label.textAlignment = .left
        label.font = .systemFont(ofSize: Constant.multiplyToWidth(number: 30))
        return label
    }()
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isScrollEnabled = false
        tableView.backgroundColor = .clear
        tableView.rowHeight = Constant.multiplyToHeight(number: 60)
        tableView.separatorStyle = .none
        tableView.register(SettingsTableViewCell.self, forCellReuseIdentifier: identifier)
        return tableView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        configureConstraints()
    }
    func configureViews(){
        view.backgroundColor = .catalinaBlue
        self.navigationController?.navigationBar.topItem?.title = ""
        [titleLabel, tableView].forEach({view.addSubview($0)})
    }
    func configureConstraints(){
        constrain(titleLabel, tableView, view){tl, tv, v in
            tl.top == v.top + Constant.multiplyToHeight(number: 20)
            tl.centerX == v.centerX
            tv.top == tl.top + Constant.multiplyToHeight(number: 40)
            tv.right == v.right
            tv.left == v.left
            tv.bottom == v.bottom
        }
    }
}
extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items[section].count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! SettingsTableViewCell
        let section = items[indexPath.section][indexPath.row]
        cell.cellIcon.image = section.image
        cell.titleLabel.text = section.title
        cell.backgroundColor = .clear
        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 1:
            return "Share"
        default:
            return "Additional"
        }
    }
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        (view as! UITableViewHeaderFooterView).textLabel?.textColor = .white
        (view as! UITableViewHeaderFooterView).textLabel?.font = UIFont.systemFont(ofSize: Constant.multiplyToWidth(number: 15))
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch (indexPath.section, indexPath.row) {
        case (0, 0): ShareManager.share.appStoreRate()
        case (0, 1): ShareManager.share.sendToMail(vc: self)
        case (1, 0): ShareManager.share.instagramShare(at: self, image: #imageLiteral(resourceName: "YBLogo"))
     //   case (1, 1): ShareManager.share.otherShare(vc: self)
        default: break
        }
    }
}
