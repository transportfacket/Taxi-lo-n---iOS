//
//  ModifiedNavigationBar.swift
//  Taxi lön
//
//  Created by Transport on 2018-02-20.
//  Copyright © 2018 Transportarbetareförbundet. All rights reserved.
//

import Foundation

class ModifiedNavigationBar: UINavigationBar {
    override func popItem(animated: Bool) -> UINavigationItem? {
        return super.popItem(animated: false)
    }
}
