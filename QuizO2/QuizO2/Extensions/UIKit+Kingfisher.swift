//
//  UIImageView+Kingfisher.swift
//  QuizO2
//
//  Created by Kordian Ledzion on 22/04/2018.
//  Copyright © 2018 KordianLedzion. All rights reserved.
//

import Foundation
import Kingfisher
import UIKit

extension UIImageView {
    
    func setUpImage(with url: String) {
        if let url = URL(string: url) {
            kf.setImage(with: url, placeholder: #imageLiteral(resourceName: "placeholder")) { [unowned self] (_, _, _, _) in
                self.contentMode = .scaleAspectFill
            }
        }
    }
}

extension UIButton {
    
    func setUpImage(with url: URL) {
        kf.setImage(with: url, for: .normal) { [unowned self] (_, _, _, _) in
            self.contentMode = .scaleAspectFill
        }
    }
}
