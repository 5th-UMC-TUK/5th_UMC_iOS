//
//  Image+Extension.swift
//  week2-mission
//
//  Created by Subeen on 2023/09/28.
//

import Foundation
import UIKit

public extension UIImage {
    convenience init?(_ asset: ImageAsset) {
        self.init(named: asset.rawValue, in: Bundle.main, with: nil)
    }

    convenience init?(assetName: String) {
        self.init(named: assetName, in: Bundle.main, with: nil)
    }
    
}

//public extension UIImageView {
//    convenience init?(_ asset: ImageAsset) {
//        self.init(UIImage(assetName: asset.rawValue))
//    }
//}


//extension Image {
//    init(asset: ImageAsset) {
//        if let uiImage = UIImage(asset) {
//            self.init(uiImage: uiImage)
//        } else {
//            self = Image(systemName: "questionmark")
//        }
//    }
//
//    init(assetName: String) {
//        if let uiImage = UIImage(assetName: assetName) {
//            self.init(uiImage: uiImage)
//        } else {
//            self = Image(systemName: "questionmark")
//        }
//    }
//}

//import UIKit
//enum Image: String {
//case AppIconWhite
//}
//extension Image {
//func image() -> UIImage {
//return UIImage(named: self.rawValue) ?? UIImage()
//    }
//}
