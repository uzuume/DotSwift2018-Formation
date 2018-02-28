import Foundation

public struct Model<Element> {
    private let privateArray: [Element]
    
    public init(_ elements: Element...) {
        self.init(privateArray: elements)
    }
    
    private init(privateArray: [Element]) {
        self.privateArray = privateArray
    }
}

extension Model {
    public func removed(at index: Int) -> Model {
        var mutableArray = privateArray
        mutableArray.remove(at: index)
        return Model(privateArray: mutableArray)
    }
    
    public func inserted(_ newElement: Element,
                         at index: Int) -> Model {
        var mutableArray = privateArray
        mutableArray.insert(newElement, at: index)
        return Model(privateArray: mutableArray)
    }
    public func moved(from fromIndex: Int,
                      to toIndex: Int) -> Model {
        return removed(at: fromIndex)
            .inserted(privateArray[fromIndex],
                      at: toIndex)
    }
}

extension Model where Element: CustomStringConvertible {
    public subscript(index: Int) -> String {
        return privateArray[index].description
    }
    public var count: Int {
        return privateArray.count
    }
}

extension Model: CustomStringConvertible {
    public var description: String {
        return privateArray.description
    }
}

extension Model where Element: Equatable {
    public func removed(_ element: Element) -> Model {
        guard let location
            = privateArray.index(of: element) else {return self}
        return removed(at: location)
    }
}

extension Model: Sequence {
    public func makeIterator() -> AnyIterator<Element> {
        var iterator = privateArray.makeIterator()
        return AnyIterator{
            return iterator.next()
        }
    }
}

