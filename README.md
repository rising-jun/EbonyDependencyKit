# EbonyDependencyKit

[![CI Status](https://img.shields.io/travis/rising-jun/EbonyDependencyKit.svg?style=flat)](https://travis-ci.org/rising-jun/EbonyDependencyKit)
[![Version](https://img.shields.io/cocoapods/v/EbonyDependencyKit.svg?style=flat)](https://cocoapods.org/pods/EbonyDependencyKit)
[![License](https://img.shields.io/cocoapods/l/EbonyDependencyKit.svg?style=flat)](https://cocoapods.org/pods/EbonyDependencyKit)
[![Platform](https://img.shields.io/cocoapods/p/EbonyDependencyKit.svg?style=flat)](https://cocoapods.org/pods/EbonyDependencyKit)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

EbonyDependencyKit is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'EbonyDependencyKit'
```

## How to use
```swift
import EbonyDependencyKit

final class DependencyInjector: DependencyInjectable {
    static var dependencyDictionary: [ObjectIdentifier: Any] = [
        ObjectIdentifier(FirstViewController.self): FirstDependency(manager: FirstUseCase())]
    
    static func injecting<T: DependencySetable>(to compose: T){
        guard let dependency = dependencyDictionary[ObjectIdentifier(type(of: compose.self))] as? T.DependencyType else {
            return
        }
        compose.setDependency(dependency: dependency)
    }
}
```
```swift
import UIKit
import EbonyDependencyKit

class FirstViewController: UIViewController, DependencySetable {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        DependencyInjector.injecting(to: self)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        DependencyInjector.injecting(to: self)
    }
    
    private var firstManagable: FirstManagable?
    var dependency: FirstDependency? {
        didSet { self.firstManagable = dependency?.manager }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        firstManagable?.printWhenSetting()
    }
}
```
```swift
protocol FirstManagable {
    func printWhenSetting()
}

final class FirstUseCase: FirstManagable {
    func printWhenSetting() {
        print("Hi There")
    }
}
```
```swift
import EbonyDependencyKit

struct FirstDependency: Dependency {
    var manager: ManagerType
    typealias ManagerType = FirstManagable
}
```

## Author

rising-jun, jun36817@naver.com

## License

EbonyDependencyKit is available under the MIT license. See the LICENSE file for more info.
