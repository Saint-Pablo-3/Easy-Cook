import UIKit

extension UIImageView {
    func setImageColor(color: UIColor) {
            let templateImage = self.image?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
            self.image = templateImage
            self.tintColor = color
        }
    }
