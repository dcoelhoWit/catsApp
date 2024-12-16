//
//  Measures.swift
//  CatsApp
//
//  Created by Diogo Coelho on 15/12/2024.
//


import SwiftUI

enum SpacingMeasures: CGFloat {
    case regularSpacer = 16.00
    case smallSpacer = 10.00
    case tinySpacer = 5.00
}

enum SizingMeasures: CGFloat {
    case shadowHeight = 10.0
    case tabSelectorHeight = 5.00
    case sendButtonSize = 25.00
}

enum FontSizes: CGFloat {
    case titleFontSize = 30.00
    case listRegularText = 17.00
    case listSmallText = 14.00
}

enum IconMeasures: CGFloat {
    case themesIconSize = 40.00
    case readMeIconSize = 35.00
    case ellipsisIconSize = 20.00
    case backIconSize = 25.00
    case dismissIconSize = 30.00
}

enum ImageMeasures: CGFloat {
    case thumbnailSize = 70.00
    case roundedImageCornerSize = 8.0
    case carouselImageSize = 100.00
}
