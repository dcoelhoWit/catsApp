//
//  String+i18n.swift
//  CatsApp
//
//  Created by Diogo Coelho on 15/12/2024.
//

import Foundation

extension String {
    
    func localized(_ comment: String = "") -> String {
        return NSLocalizedString(self, comment: comment)
    }
}
