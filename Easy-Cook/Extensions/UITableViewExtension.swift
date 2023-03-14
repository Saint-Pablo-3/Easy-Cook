import UIKit

extension UITableView {
    func pin(to View: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: View.topAnchor, constant: 50).isActive = true
        leadingAnchor.constraint(equalTo: View.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: View.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: View.bottomAnchor, constant: -100).isActive = true
    }
}
