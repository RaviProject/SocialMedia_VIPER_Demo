import UIKit

class BaseVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let backItem = UIBarButtonItem()
        backItem.image = UIImage(named: "icn_back")
        navigationItem.leftBarButtonItem = backItem
        
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.largeTitleDisplayMode = .automatic
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont(name: "Roboto-Bold", size: 18) ?? UIFont.systemFont(ofSize: 18)]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.cancel, handler: nil)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    public func passwordMismatch(_ txtVal: UITextField, _ txtVal1: UITextField) -> Bool
    {
        if TRIM(string: txtVal.text ?? "") != TRIM(string: txtVal1.text ?? "")
        {
            return false
        }
        return true
    }
    
    public func TRIM(string: Any) -> String {
        return (string as AnyObject).trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
}
