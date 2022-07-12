//
//  DependencyInjector.swift
//  EbonyDependencyKit_Example
//
//  Created by 김동준 on 2022/07/12.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import EbonyDependencyKit

final class DependencyInjector: DependencyInjectable {
    static var dependencyDictionary: [ObjectIdentifier: Any] = [
        ObjectIdentifier(FirstViewController.self): FirstDependency(manager: FirstUseCase())]
    
    static func injecting<T: DependencySetable>(to compose: T){
        guard let dependency = dependencyDictionary[ObjectIdentifier(type(of: compose.self))],
              let detailedDependency = dependency as? T.DependencyType else {
                  return
              }
        compose.setDependency(dependency: detailedDependency)
    }
}
