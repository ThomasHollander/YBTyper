import Foundation
import MessageUI
import Social
class ShareManager: NSObject, UIDocumentInteractionControllerDelegate {
    static let share = ShareManager()
    var documentInteractionController = UIDocumentInteractionController()
    func sendToMail(vc: UIViewController) {
        let composer = MFMailComposeViewController()
        if MFMailComposeViewController.canSendMail() {
            composer.mailComposeDelegate = self
            composer.setToRecipients(["xianbeng1115395@mail.ru"])
            composer.setSubject("YB-Typer App Suggestions")
            vc.present(composer, animated: true, completion: nil)
        }
    }
    func appStoreRate() {
        guard let url = URL(string : "itms-apps://itunes.apple.com/ru/app/id1478862140") else { return }
        guard #available(iOS 10, *) else {
            UIApplication.shared.openURL(url)
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    func instagramShare(at vc: UIViewController, image: UIImage) {
        DispatchQueue.main.async {
            self.postImageToInstagramWithCaption(imageInstagram: image, instagramCaption: "some caption", view: vc.view, delegate: vc)
        }
    }
    func postImageToInstagramWithCaption(imageInstagram: UIImage, instagramCaption: String, view: UIView, delegate: UIViewController) {
        let instagramURL = NSURL(string: "instagram://app")
        if UIApplication.shared.canOpenURL(instagramURL! as URL) {
            let jpgPath = (NSTemporaryDirectory() as NSString).appendingPathComponent("instagram.igo")
            do {
                try UIImageJPEGRepresentation(imageInstagram, 1.0)?.write(to: URL(fileURLWithPath: jpgPath), options: .atomic)
            } catch {
                print(error)
            }
            let rect = CGRect(x: 0, y: 0, width: 612, height: 612)
            let fileURL = NSURL.fileURL(withPath: jpgPath)
            documentInteractionController.url = fileURL
            documentInteractionController.delegate = delegate as? UIDocumentInteractionControllerDelegate
            documentInteractionController.uti = "com.instagram.exclusivegram"
            documentInteractionController.annotation = ["InstagramCaption": instagramCaption]
            documentInteractionController.presentOpenInMenu(from: rect, in: view, animated: true)
        } else {
        }
    }
    func otherShare(vc: UIViewController) {
        let image = #imageLiteral(resourceName: "YBLogo")
        let activityViewController = UIActivityViewController(activityItems: [image], applicationActivities: [])
        vc.present(activityViewController, animated: true)
    }
    func takeScreenshot(_ shouldSave: Bool = true) -> UIImage? {
        var screenshotImage :UIImage?
        let layer = UIApplication.shared.keyWindow!.layer
        let scale = UIScreen.main.scale
        UIGraphicsBeginImageContextWithOptions(layer.frame.size, false, scale);
        guard let context = UIGraphicsGetCurrentContext() else {return nil}
        layer.render(in:context)
        screenshotImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        if let image = screenshotImage, shouldSave {
            UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        }
        return screenshotImage
    }
}
extension ShareManager: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
}
