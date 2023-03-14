import UIKit

class WelcomeViewController: UIViewController {
    
    private let welcomeView = WelcomeView()
    
    private  let getStartedButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .redAccent
        button.titleLabel?.textColor = .whiteAccent
        button.titleLabel?.font = .poppinsBold16()
        button.setTitle("Get started", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonTapped(button:)), for: .touchUpInside)
        return button
    }()
    
    override func loadView() {
        view = welcomeView
        view.addSubview(getStartedButton)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadView()
        setConstraints()
    }
    
    @objc private func buttonTapped(button: UIButton) {
         let mainVC = NavigationViewController()
         mainVC.modalPresentationStyle = .fullScreen
        present(mainVC, animated: true)
    }
    
}

//MARK: - SetConstraints
extension WelcomeViewController {
   private func setConstraints() {
        NSLayoutConstraint.activate([
            getStartedButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            getStartedButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80),
            
            getStartedButton.widthAnchor.constraint(equalToConstant: 150),
            getStartedButton.heightAnchor.constraint(equalToConstant: 60),
            
        ])
    }
}
