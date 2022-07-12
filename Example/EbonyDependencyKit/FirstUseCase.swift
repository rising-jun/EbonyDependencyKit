//
//  FirstUseCase.swift
//  EbonyDependencyKit_Example
//
//  Created by 김동준 on 2022/07/12.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import Foundation

protocol FirstManagable {
    func printWhenSetting()
}

final class FirstUseCase: FirstManagable {
    func printWhenSetting() {
        print("Hi There")
    }
}
