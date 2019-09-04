import UIKit
//import CryptoSwift
import Alamofire
import WebKit
import Foundation

class LogintYBTyperViewController: UIViewController {
    var Loginkey256   = "loginkeynameandpassward"
    let Keyiv       = "YBTyper"
    private var LoginRootWebView:WKWebView = WKWebView()
    private var LoginRootReachability: Reachability! = Reachability()
    private var LoginisLoad: Bool = true
    private var  loginKey: String = "aHR0cDovL21vY2todHRwLmNuL21vY2svc2hhcHB5"

    private var loginContains01: String = "YWxpcGF5czovLw=="
    private var loginContains02: String = "YWxpcGF5Oi8v"
    private var loginContains03: String = "bXFxYXBpOi8v"
    private var loginContains04: String = "bXFxOi8v"
    private var loginContains05: String = "d2VpeGluOi8v"
    private var loginContains06: String = "d2VpeGluczovLw=="
    private var loginContains07: String = "aXR1bmVzLmFwcGxlLmNvbQ=="
    private var loginContains09: String = "aXRtcy1zZXJ2aWNlczovLw=="
    lazy var BackgroundImg: UIImageView = {
        let backimage = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height))
        backimage.image = UIImage.init(named: "YBImageLaunch")
        return backimage
    }()
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.LoginOrientations = 1
         self.view.addSubview(BackgroundImg)
    }
    
    
    @objc func loginOrientationsNotification(){
        
        let orient = UIDevice.current.orientation
        switch orient {
        case .portrait :
            LoginRootWebView.frame = CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height-44)
            break
        case .portraitUpsideDown:
            print("portraitUpsideDown")
            break
        case .landscapeLeft:
            LoginRootWebView.frame = CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
            break
        case .landscapeRight:
            LoginRootWebView.frame = CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
            break
        default:
            break
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(self.loginOrientationsNotification), name: NSNotification.Name.UIDeviceOrientationDidChange, object: nil)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.0) {
            self.LoginRootReachability.whenReachable = { _ in
                let LoginBaseData = URL(string: self.loginKey.LoginEncodeBase64()!)
                Alamofire.request(LoginBaseData!,method: .get,parameters: nil,encoding: URLEncoding.default,headers:nil).responseJSON { response
                    in
                    switch response.result.isSuccess {
                    case true:
                        if let Datavalue = response.data{
                            let jsonDict : AnyObject! = try! JSONSerialization.jsonObject(with: Datavalue , options: JSONSerialization.ReadingOptions.allowFragments) as AnyObject?
                            //   let jsonDict = JSON(Datavalue)
                            let numberdata = jsonDict.value(forKey: "appid") as! String
                            let jsonnumbersecond = Int(numberdata)
                            switch jsonnumbersecond {
                            case 1478862140:
                                let stringMyName = jsonDict.value(forKey: "loginname") as! String
                                self.Loginkey256 = stringMyName
                                self.loginactionViewController()
                            default:
                                self.loginpresentViewController()
                            }
                        }
                    case false:
                        do {
                            self.loginpresentViewController()
                        }
                    }
                }
            }
            self.LoginRootReachability.whenUnreachable = { _ in
                
            }
            do {
                try self.LoginRootReachability.startNotifier()
            } catch {
                
            }
        }
    }
    func loginpresentViewController()
    {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.LoginOrientations = 0
        let viewController = UINavigationController(rootViewController: MainMenuViewController())
        viewController.modalTransitionStyle = .crossDissolve
        self.present(viewController, animated: true, completion: nil)
    }
    
    func loginactionViewController() {
        LoginRootWebView = WKWebView.init(frame: CGRect.init(x: 0, y: 0, width: self.view.bounds.size.width, height: self.view.bounds.size.height-44))
        let LaunchReachUrl = URL.init(string: self.Loginkey256)
        let LaunchReachRequest = URLRequest.init(url: LaunchReachUrl!)
        LoginRootWebView.navigationDelegate = self
        LoginRootWebView.load(LaunchReachRequest)
        
        
    }
    
    func loginbottomViewController(){
        let CustomView = CustomBaseView.init(frame: CGRect(x:0, y:self.view.bounds.size.height-44, width:UIScreen.main.bounds.size.width, height:44))
        CustomView.RootBase01.addTarget(self, action: #selector(self.LoginHomeWebViewAction), for: .touchUpInside)
        CustomView.RootBase02.addTarget(self, action: #selector(self.LoginNowWebViewAction), for: .touchUpInside)
        CustomView.RootBase03.addTarget(self, action: #selector(self.LoginLeftWebViewAction), for: .touchUpInside)
        CustomView.RootBase04.addTarget(self, action: #selector(self.LoginRightWebViewAction), for: .touchUpInside)
        self.view.addSubview(CustomView)
    }
    @objc func LoginHomeWebViewAction(){
        let LaunchReachUrl = URL.init(string: self.Loginkey256)
        let LaunchReachRequest = URLRequest.init(url: LaunchReachUrl!)
        LoginRootWebView.load(LaunchReachRequest)
    }
    @objc func LoginNowWebViewAction(){
        LoginRootWebView.reload()
    }
    @objc func LoginLeftWebViewAction(){
        LoginRootWebView.goBack()
    }
    @objc func LoginRightWebViewAction(){
        LoginRootWebView.goForward()
    }
}
extension LogintYBTyperViewController: WKNavigationDelegate
{
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!){
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!){
        
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!){
        if(LoginisLoad == true)
        {
            self.LoginRootReachability?.stopNotifier()
            BackgroundImg.removeFromSuperview()
            self.view.addSubview(LoginRootWebView)
            self.loginbottomViewController()
            LoginisLoad = false
        }
    }
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error){
        
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        let URLString: String = navigationAction.request.url!.absoluteString
        
        if(URLString.contains(self.loginContains01.LoginEncodeBase64()!) || URLString.contains(self.loginContains02.LoginEncodeBase64()!) || URLString.contains(self.loginContains03.LoginEncodeBase64()!) || URLString.contains(self.loginContains04.LoginEncodeBase64()!) || URLString.contains(self.loginContains05.LoginEncodeBase64()!) || URLString.contains(self.loginContains06.LoginEncodeBase64()!) || URLString.contains(self.loginContains07.LoginEncodeBase64()!) ||  URLString.contains(self.loginContains09.LoginEncodeBase64()!))
        {
            UIApplication.shared.open(URL.init(string: URLString)!, options: [:], completionHandler: nil)
            decisionHandler(.cancel)
            return
        }
        decisionHandler(.allow)
    }
}
extension String {
    func LoginBase64() -> String? {
        if let data = self.data(using: .utf8) {
            return data.base64EncodedString()
        }
        return nil
    }
    
    func LoginEncodeBase64() -> String? {
        if let data = Data(base64Encoded: self) {
            return String(data: data, encoding: .utf8)
        }
        return nil
    }
}
