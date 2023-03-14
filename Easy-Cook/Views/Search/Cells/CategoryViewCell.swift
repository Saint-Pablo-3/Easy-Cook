import UIKit

class CategoryViewCell: UICollectionViewCell {

    let backgroundImage: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        image.backgroundColor = .redAccent
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    let recipeLabel: UILabel = {
        let label = UILabel()
        label.font = .poppinsBold12()
        label.textColor = .whiteAccent
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()


    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
        setupCellConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: - setupCell
extension CategoryViewCell {
    func setupCell() {
        backgroundColor = .backgroundColor
        addSubview(backgroundImage)
        backgroundImage.addSubview(recipeLabel)

    }
}

// MARK: - setupCellConstraints
extension CategoryViewCell {
    func setupCellConstraints() {
        backgroundImage.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        backgroundImage.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        backgroundImage.topAnchor.constraint(equalTo: topAnchor).isActive = true
        backgroundImage.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true

        recipeLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        recipeLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
}
