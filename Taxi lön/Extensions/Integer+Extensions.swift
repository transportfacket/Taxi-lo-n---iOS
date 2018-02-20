//
//  Integer+Extensions.swift
//  Taxi lön
//
//  Created by Transport on 2018-02-20.
//  Copyright © 2018 Transportarbetareförbundet. All rights reserved.
//

import Foundation

extension BinaryInteger{
    var formattedWithSeparator: String {
        return Formatter.withSeparator.string(for: self) ?? ""
    }
} 
