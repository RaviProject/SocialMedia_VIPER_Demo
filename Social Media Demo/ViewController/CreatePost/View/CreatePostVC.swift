import UIKit

class CreatePostVC: BaseVC {
    
    //MARK: - Outlets
    @IBOutlet weak var dashView: RectangularDashedView!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var txtBgView: UIView!
    @IBOutlet weak var txtView: GrowingTextView!
    
    //MARK: - Dependencies
    var output: CreatePostViewOutput!
    var imagePicker = UIImagePickerController()
    var selectedImg = UIImage()
    var user = ""
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }

    private func setup() {
        self.txtBgView.layer.borderColor = UIColor(named: "color0037AC")?.cgColor
        self.txtBgView.layer.borderWidth = 1
        self.txtBgView.layer.cornerRadius = 10
        self.txtBgView.layer.masksToBounds = true
    }
    
    //MARK: - Action Method
    @IBAction func btnSubmit_Clicked(_ sender: UIButton) {
        if self.txtView.text.isEmpty {
            let alertController = UIAlertController(title: "Post", message: "Please add text first", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
        } else if self.selectedImg == UIImage() {
            let alertController = UIAlertController(title: "Post", message: "Please select image", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
        } else {
            output.savePost(user: self.user, text: self.txtView.text, img: self.selectedImg)
        }
    }
    
    @IBAction func btnUploadImg_Clicked(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            imagePicker.delegate = self
            imagePicker.sourceType = .savedPhotosAlbum
            imagePicker.allowsEditing = false
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    @IBAction func btnBack_Clicked(_ sender: UIButton) {
        output.btnBack_Clicked()
    }
    
    
    //MARK: - Private Method
}

//MARK: - CreatePostViewInput
extension CreatePostVC : CreatePostViewInput {
    
}

extension CreatePostVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerOriginalImage")] as? UIImage {
            self.img.contentMode = .scaleAspectFit
            self.dashView.betweenDashesSpace = 0
            self.img.image = image
            self.selectedImg = image
        }
        dismiss(animated: true)
    }
}
