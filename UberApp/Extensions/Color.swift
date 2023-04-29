//
//  Color.swift
//  UberApp
//
//  Created by Nick Pavlov on 4/28/23.
//

import Foundation
import SwiftUI

extension Color {
    static let theme = ColorTheme()
}

struct ColorTheme {
    let backgroundColor = Color("BackgroundColor")
    let secondaryBackgroundColor = Color("SecondaryBackground")
    let primaryTextColor = Color("PrimaryTextColor")
}
