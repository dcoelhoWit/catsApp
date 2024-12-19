//
//  Measures.swift
//  CatsApp
//
//  Created by Diogo Coelho on 15/12/2024.
//


import SwiftUI

struct SpacingMeasures {
    static let regularSpacer: CGFloat = 16.00
    static let smallSpacer: CGFloat = 10.00
    static let tinySpacer: CGFloat = 5.00
}

struct SizingMeasures {
    static let shadowHeight: CGFloat = 10.0
    static let tabSelectorHeight: CGFloat = 5.00
    static let sendButtonSize: CGFloat = 25.00
    static let offlineModeButtonHeight: CGFloat = 50.00
}

struct FontSizes {
    static let titleFontSize: CGFloat = 30.00
    static let listRegularText: CGFloat = 17.00
    static let listSmallText: CGFloat = 14.00
}

struct IconMeasures {
    static let themesIconSize: CGFloat = 40.00
    static let readMeIconSize: CGFloat = 35.00
    static let ellipsisIconSize: CGFloat = 20.00
    static let backIconSize: CGFloat = 25.00
    static let dismissIconSize: CGFloat = 30.00
    static let favIconSize: CGFloat = 30.00
}

struct ImageMeasures {
    static let thumbnailSize: CGFloat = 70.00
    static let roundedImageCornerSize: CGFloat = 8.0
    static let detailsImageSize:CGFloat = 150.00
}

struct CornerRadiusMeasures {
    static let standard = CGSize(width: 8.0, height: 8.0)
    static let search = CGSize(width: 20.0, height: 20.0)
}
