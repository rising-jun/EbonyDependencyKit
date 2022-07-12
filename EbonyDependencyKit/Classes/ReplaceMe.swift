import Foundation

public protocol DependencyInjectable {
    static var dependencyDictionary: [ObjectIdentifier: Any] { get }
    static func injecting<T: DependencySetable>(to compose: T)
}

public protocol DependencySetable: AnyObject {
    associatedtype DependencyType
    var dependency: DependencyType? { get set }
}
extension DependencySetable {
    public func setDependency(dependency: DependencyType) {
        self.dependency = dependency
    }
}

public protocol Dependency{
    associatedtype ManagerType
}
