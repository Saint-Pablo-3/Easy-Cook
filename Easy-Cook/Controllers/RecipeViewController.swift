import UIKit
import Kingfisher
import SafariServices

class RecipeViewController: UIViewController {
    
    var requestManager = RequestManager()
    
    var subviewsCount = Int()
    
//    var collectionView: UICollectionView!
    
    var activityIndicatorView: UIActivityIndicatorView = { //indicator
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.startAnimating()
        indicator.hidesWhenStopped = true
        return indicator
    }()
    
    let scrollView: UIScrollView = { // scrolling View
        let scrollView = UIScrollView(frame: .zero)
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    // "like" button
    var likesButton: LikeButton = {
        return LikeButton()
    }()
    
    // title recipe's label
    var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.poppinsBold35()
        label.textColor = .textAccent
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        return label
    }()
    
    var imageView: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 20
        image.clipsToBounds = true
        return image
    }()
    
    // cooking time label
    let timeLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .textAccent
        label.font = UIFont.poppinsBold16()
        return label
    }()
    
    // serving label (portions amount)
    var servingLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = .textAccent
        label.font = UIFont.poppinsBold16()
        return label
    }()
    
    // likes label
    var likesLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = .textAccent
        label.font = UIFont.poppinsBold16()
        return label
    }()
    
    // ingredients label
    var ingredientsLabel: UILabel = {
        let label = UILabel()
        label.text = "   Ingredients Check List"
        label.textAlignment = .left
        label.textColor = .textAccent
        label.font = UIFont.poppinsBold18()
        return label
    }()
    
    // buttonArray (TODO list)
    var buttonArray = [UIButton]()
   
    
    let recipeLabel: UILabel = {
        let label = UILabel()
        label.text = "Direction"
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = .textAccent
        return label
    }()
    
    let sourceButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.textAccent, for: .normal)
        let attributedString = NSMutableAttributedString(string: "Go to the source")
        attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0, attributedString.length))
        button.setAttributedTitle(attributedString, for: .normal)
        button.addTarget(self, action: #selector(goSafari), for: .touchUpInside)
        return button
    }()
    
    @objc func goSafari() {
        guard  let url = URL(string: sourceURL) else { return }
        let configuration = SFSafariViewController.Configuration()
        let safariVC = SFSafariViewController(url: url, configuration: configuration)
        safariVC.modalPresentationStyle = .formSheet
        present(safariVC, animated: true, completion: nil)
    }
    
    var sourceURL = ""
    
    var id: Int
    
    init(_ id: Int) {
        self.id = id
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        self.id = 10000
        
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        likesButton.updateApperance()
        indicatorViewWork()
        view.backgroundColor = .backgroundColor
        requestManager.delegate = self
        requestManager.fetchRecipe(id)
    }
    
//    @objc func likeButtonPressed() {
//    }
}

extension RecipeViewController {
    
    func indicatorViewWork() {
        view.addSubview(activityIndicatorView)
        activityIndicatorView.center = view.center
    }
    
    func setupViews() {
        let infoStackView = UIStackView(arrangedSubviews: [timeLabel, servingLabel, likesLabel])
        infoStackView.axis = .horizontal
        infoStackView.alignment = .fill
        infoStackView.distribution = .equalCentering
        
        
        for button in buttonArray {
            button.layer.cornerRadius = 10
            button.titleEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 30)
            button.backgroundColor = .clear
            button.setTitleColor(.textAccent, for: .normal)
            button.titleLabel?.font = UIFont.poppinsRegular16()
            button.titleLabel?.numberOfLines = 0
            button.contentHorizontalAlignment = .left
            button.backgroundColor = .clear
        }
        

        let toDoButtonStackView = UIStackView(arrangedSubviews: buttonArray)
        toDoButtonStackView.axis = .vertical
        toDoButtonStackView.alignment = .fill
        toDoButtonStackView.distribution = .fillEqually
        toDoButtonStackView.spacing = 20
        
        for i in [scrollView, likesButton, titleLabel, imageView, infoStackView, toDoButtonStackView, ingredientsLabel, recipeLabel, sourceButton] {
            i.translatesAutoresizingMaskIntoConstraints = false
        }
        
        view.addSubview(scrollView)
        
        for i in [titleLabel, imageView, infoStackView, toDoButtonStackView, ingredientsLabel, recipeLabel, likesButton, sourceButton] {
            scrollView.addSubview(i)
        }
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 6),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 0),
            titleLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 0),
            titleLabel.heightAnchor.constraint(equalToConstant: 180),
            
            imageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            imageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 0),
            imageView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 0),
            imageView.heightAnchor.constraint(equalToConstant: 300),
            
            infoStackView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 34),
            infoStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 0),
            infoStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 0),
            infoStackView.heightAnchor.constraint(equalToConstant: 50),
            
            ingredientsLabel.topAnchor.constraint(equalTo: infoStackView.bottomAnchor, constant: 34),
            ingredientsLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 0),
            ingredientsLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 0),
            
            toDoButtonStackView.topAnchor.constraint(equalTo: ingredientsLabel.bottomAnchor, constant: 8),
            toDoButtonStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 0),
            toDoButtonStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 0),
            
            recipeLabel.topAnchor.constraint(equalTo: toDoButtonStackView.bottomAnchor, constant: 34),
            recipeLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 0),
            recipeLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 0),
            recipeLabel.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            recipeLabel.bottomAnchor.constraint(equalTo: sourceButton.topAnchor),
            
            likesButton.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -16),
            likesButton.rightAnchor.constraint(equalTo: imageView.rightAnchor, constant: -16),
            likesButton.heightAnchor.constraint(equalToConstant: 40),
            likesButton.widthAnchor.constraint(equalToConstant: 40),

            sourceButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 0),
            sourceButton.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 0),
            sourceButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0),
            sourceButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}

extension RecipeViewController: RequestManagerDelegate {
    
    func didUpdateRecipe(_ requestManager: RequestManager, recipe: RecipeModel) {
        
        DispatchQueue.main.async {
            
            self.likesButton.setItem(item: recipe)
            
            self.titleLabel.text = recipe.title // title
            
            self.imageView.kf.setImage(with: URL(string: recipe.image))
            
        
            self.timeLabel.text = "\(recipe.minutes) \nminutes"
            self.servingLabel.text = "\(recipe.servings) \nservings"
            self.likesLabel.text = "\(recipe.likes) \nlikes"
            
            for i in 0...recipe.ingredients.count - 1 {
                let originalIngridients = recipe.ingredients[i].original
                //                let button = UIButton(type: .system)
                let button = UIButton(type: .system)
                button.addTarget(self, action: #selector(self.buttonTouched(_:)), for: .touchUpInside)
                button.setTitle(originalIngridients, for: .normal)
                self.buttonArray.append(button)
            }
            

            var recipeText = recipe.steps.isEmpty ? "\(recipe.sourceURL)" : "\(recipe.steps)"
            
            let regex = try! NSRegularExpression(pattern: "(^\\[\"|\"\\]$)", options: .caseInsensitive)
            recipeText = regex.stringByReplacingMatches(in: recipeText, options: [], range: NSRange(0..<recipeText.utf16.count), withTemplate: "")
            
            self.recipeLabel.text! += "\n\(recipeText)"
            
            let recipeString = NSMutableAttributedString(string: self.recipeLabel.text!)
            recipeString.setAttributes([NSAttributedString.Key.font: UIFont.poppinsBold18()!],
                                       range: NSMakeRange(0, 9))
            self.recipeLabel.attributedText = recipeString
            
        
            self.sourceURL = recipe.sourceURL

            self.setupViews()
            self.activityIndicatorView.stopAnimating()
            print(recipe)
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
    @objc func buttonTouched(_ sender: UIButton) {
        
        let imageView = UIImageView(image: UIImage(named: "checkmark"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        if sender.subviews.count == subviewsCount {
            sender.subviews.last?.removeFromSuperview()
        } else {
            sender.addSubview(imageView)
            subviewsCount = sender.subviews.count
            NSLayoutConstraint.activate([
                imageView.centerYAnchor.constraint(equalTo: sender.centerYAnchor),
                imageView.trailingAnchor.constraint(equalTo: sender.trailingAnchor, constant: -10),
                imageView.heightAnchor.constraint(equalToConstant: 16),
                imageView.widthAnchor.constraint(equalToConstant: 16)
            ])
        }
    }
}
