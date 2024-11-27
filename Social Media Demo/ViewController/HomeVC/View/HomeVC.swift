import UIKit

class HomeVC: BaseVC {
    
    //MARK: - Outlets
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var btnCreatePost: UIButton!
    @IBOutlet weak var btnProfile: UIButton!
    
    //MARK: - Dependencies
    var output: HomeViewOutput!
    var allPosts: [(user: String, post: Post)] = []
    var user = "User 1"
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        output.loadPosts()
    }
    
    private func setup() {
        self.tblView.register(UINib(nibName: "PostCell", bundle: nil), forCellReuseIdentifier: "PostCell")
        self.tblView.separatorStyle = .none
        
        let action1 = UIAction(title: "User 1", image: UIImage()) { _ in
            self.user = "User 1"
            print("Option 1 selected")
        }
        let action2 = UIAction(title: "User 2", image: UIImage()) { _ in
            self.user = "User 2"
            print("Option 2 selected")
        }
        let action3 = UIAction(title: "User 3", image: UIImage()) { _ in
            self.user = "User 3"
            print("Option 3 selected")
        }
        let menu = UIMenu(title: "Select an User", options: .displayInline, children: [action1, action2, action3])
        
        btnProfile.menu = menu
        btnProfile.showsMenuAsPrimaryAction = true
    }
    
    //MARK: - Action Method
    @IBAction func btnCreatePost_Clicked(_ sender: UIButton) {
        output.btnCreatePost_Clicked(user: self.user)
    }
    
    @IBAction func btnProfile_Clicked(_ sender: UIButton) {
    }
    
    //MARK: - Private Method
}

//MARK: - LoginViewInput
extension HomeVC : HomeViewInput {
    func getPosts(allPosts: [(user: String, post: Post)]) {
        self.allPosts = allPosts
        self.tblView.reloadData()
    }
    
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.allPosts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell") as! PostCell
        let post = self.allPosts[indexPath.row]
        cell.layoutIfNeeded()
        cell.lblName.text = post.user
        switch post.user {
            case "User 1":
            cell.lblUsername.text = "@user_1"
        case "User 2":
            cell.lblUsername.text = "@user_2"
        case "User 3":
            cell.lblUsername.text = "@user_3"
        default:
            break
        }
        cell.lblDes.text = post.post.text
        cell.img.image = post.post.getImage()
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
