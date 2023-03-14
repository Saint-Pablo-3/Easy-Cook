import UIKit

class WelcomeView: UIView {
    
    private let backgroundImage: UIImageView = {
        let backgroundImage = UIImageView()
        backgroundImage.image = UIImage(named: StringConstants.mainViewBackgroundImage )
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        return backgroundImage
    }()
    
    private let upperSubtitleLabel: UILabel = {
        let label = UILabel()
        label.text =  "⭐️ 100k + Premium recipes"
        label.font = .poppinsRegular16()
        label.textAlignment = .center
        label.textColor = .white
        label.shadowColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.text = "cook \n #WithMe"
        label.font = .poppinsBold50()
        label.textAlignment = .center
        label.textColor = .white
        label.shadowColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let bottomSubtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Find best recipes for cooking"
        label.font = .poppinsRegular16()
        label.textAlignment = .center
        label.textColor = .white
        label.shadowColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addViews() {
        addSubview(backgroundImage)
        addSubview(upperSubtitleLabel)
        addSubview(titleLabel)
        addSubview(bottomSubtitleLabel)
    }
}

//MARK: - SetConstraints
extension WelcomeView {
   private func setConstraints() {
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: topAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: trailingAnchor),
        
            upperSubtitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 60),
            upperSubtitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -210),
            titleLabel.widthAnchor.constraint(equalToConstant: 320),
            titleLabel.heightAnchor.constraint(equalToConstant: 150),
            
            bottomSubtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 0),
            bottomSubtitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
        
        ])
    }
}
