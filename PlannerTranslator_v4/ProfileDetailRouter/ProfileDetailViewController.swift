import UIKit

class ProfileDetailViewController: UIViewController {
    
//    let userDef = UserDefaults.standard
    
    let userDefaults = UserDefaults.standard
    
    var nameTextField: UITextField = UITextField()
    var contact1TextField: UITextField = UITextField()
    var contact2TextField: UITextField = UITextField()
    
    var saveButton: UIButton = UIButton()
    let shareButton = UIButton()
    
//    var presenter: ProfileDetailPresenterProtocol?
//    var enableForEdit: Bool = false {
//        didSet {
//        }
//    }
    
    private func baseConfigure() {
        view.backgroundColor = UIColor.white
        
        nameTextField.placeholder = "Введите ФИО"
        contact1TextField.placeholder = "Введите логин телеграмма"
        contact2TextField.placeholder = "Введите почту"
        
        nameTextField.textColor = UIColor.black
        contact1TextField.textColor = UIColor.black
        contact2TextField.textColor = UIColor.black
        
    }
    
    func setupConstraints() {
        [
            nameTextField,
            contact1TextField,
            contact2TextField,
            saveButton,
            shareButton
            
        ].forEach { customView in
            view.addSubview(customView)
            customView.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            
            nameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            nameTextField.heightAnchor.constraint(equalToConstant: 60),
            
            contact1TextField.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor),
            contact1TextField.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor),
            contact1TextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor),
            contact1TextField.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor),
            contact1TextField.heightAnchor.constraint(equalToConstant: 60),
            
            contact2TextField.leadingAnchor.constraint(equalTo: contact1TextField.leadingAnchor),
            contact2TextField.trailingAnchor.constraint(equalTo: contact1TextField.trailingAnchor),
            contact2TextField.topAnchor.constraint(equalTo: contact1TextField.bottomAnchor),
            contact2TextField.heightAnchor.constraint(equalToConstant: 60),
            contact2TextField.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor),
            
            saveButton.leadingAnchor.constraint(equalTo: contact2TextField.leadingAnchor),
            saveButton.trailingAnchor.constraint(equalTo: contact2TextField.trailingAnchor),
            saveButton.topAnchor.constraint(equalTo: contact2TextField.bottomAnchor),
            saveButton.heightAnchor.constraint(equalToConstant: 60),
            saveButton.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor),
            
            shareButton.leadingAnchor.constraint(equalTo: saveButton.leadingAnchor),
            shareButton.trailingAnchor.constraint(equalTo: saveButton.trailingAnchor),
            shareButton.topAnchor.constraint(equalTo: saveButton.bottomAnchor),
            shareButton.heightAnchor.constraint(equalToConstant: 60),
            shareButton.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor),
            
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
        baseConfigure()
        
        
        
//        presenter?.viewDidLoad()

        nameTextField.text = userDefaults.string(forKey: "name")
        contact1TextField.text = userDefaults.string(forKey: "contact1")
        contact2TextField.text = userDefaults.string(forKey: "contact2")

        saveButton.setTitle("Сохранить", for: .normal)
        view.addSubview(saveButton)
        saveButton.addTarget(self, action: #selector(didTapSaveButton), for: UIControl.Event.touchUpInside)
        saveButton.setTitleColor(.black, for: .normal)
        saveButton.backgroundColor = UIColor.lightGray
        
//        saveButton.addTarget(self, action: #selector(save), for: UIControl.Event.touchUpInside)
        
        shareButton.setTitle("Поделиться", for: .normal)
        view.addSubview(shareButton)
        //shareButton.addTarget(self, action: #selector(didTapShareButton), for: .touchUpInside)
        shareButton.addTarget(self, action: #selector(didTapShareButton), for: .touchUpInside)
        shareButton.setTitleColor(.black, for: .normal)
        shareButton.backgroundColor = UIColor.lightGray
        
        self.prepopulateData()

    }
    
    func prepopulateData()
    {
      let userDefaults = UserDefaults.standard
        nameTextField.text =  userDefaults.value(forKey: "name") as! String?
        contact1TextField.text = userDefaults.value(forKey: "contact1") as! String?
        contact2TextField.text = userDefaults.value(forKey: "contact2") as! String?

    }
    

    @objc func didTapShareButton(_ sender: Any) {
        let textMyContacts = "Мои контакты: \n"
        let objectsToShare: [Any] = [textMyContacts, nameTextField.text, contact1TextField.text, contact2TextField.text]
        let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = sender as! UIView
        
        self.present(activityVC, animated: true, completion: nil)
    }
    
    @IBAction func didTapSaveButton(_ sender: Any) {
          userDefaults.setValue(nameTextField.text, forKey: "name")
          userDefaults.setValue(contact1TextField.text, forKey: "contact1")
          userDefaults.setValue(contact2TextField.text, forKey: "contact2")
             
        let alert = UIAlertController(title: "Alert", message: "Data Saved Successfully", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
              self.present(alert, animated: true, completion: nil)
       }
}



//extension ProfileDetailViewController: ProfileDetailViewProtocol {
//    
//    func showProfile(_ profile: ProfileItem) {
//        
//        if profile.name != nil {
//            nameTextField.text = profile.name
//        }
//        
//        if profile.contact1 != nil {
//            contact1TextField.text = profile.contact1
//        }
//        
//        if profile.contact2 != nil {
//            contact2TextField.text = profile.contact2
//        }
//        
//    }
//    
//}



