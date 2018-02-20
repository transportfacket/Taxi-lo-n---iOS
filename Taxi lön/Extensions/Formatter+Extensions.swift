//
//  Formatter+Extensions.swift
//  Taxi lön
//
//  Created by Transport on 2018-02-20.
//  Copyright © 2018 Transportarbetareförbundet. All rights reserved.
//

import Foundation
extension Formatter {
    static let withSeparator: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = " "
        formatter.numberStyle = .decimal
        return formatter
    }()
}
