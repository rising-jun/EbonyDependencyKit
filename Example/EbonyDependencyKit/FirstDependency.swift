//
//  FirstDependency.swift
//  EbonyDependencyKit_Example
//
//  Created by 김동준 on 2022/07/12.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import EbonyDependencyKit

struct FirstDependency: Dependency {
    var manager: ManagerType
    typealias ManagerType = FirstManagable
}
