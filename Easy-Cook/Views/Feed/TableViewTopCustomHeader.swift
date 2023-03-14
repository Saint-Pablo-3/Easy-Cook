import UIKit

class TableViewTopCustomHeader: UITableViewHeaderFooterView {

    let title = UILabel()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configureContents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureContents() {
        title.font = title.font.withSize(40)
        title.textAlignment = .center
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = .poppinsBold35()

        contentView.addSubview(title)

        NSLayoutConstraint.activate([
            title.heightAnchor.constraint(equalToConstant: 40),
            title.trailingAnchor.constraint(equalTo:
                   contentView.layoutMarginsGuide.trailingAnchor),
            title.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            title.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }

}
