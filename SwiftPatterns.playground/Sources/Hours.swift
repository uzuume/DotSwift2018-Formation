import Foundation

public struct Hours {
    public let value: Double
    
    public init(_ value: Double) {
        self.value = value
    }
}

extension Hours: CustomStringConvertible {
    public var description: String {
        return value.description + " hours"
    }
}

extension Hours: Equatable {
    public static func ==(lhs: Hours, rhs: Hours) -> Bool {
        return lhs.value == rhs.value
    }
}


extension Hours {
    public static func +(hours1: Hours, hours2: Hours) -> Hours {
        return Hours(hours1.value + hours2.value)
    }
    public static func -(hours1: Hours, hours2: Hours) -> Hours {
        return Hours(hours1.value - hours2.value)
    }
    public static func *(hours: Hours, double: Double) -> Hours {
        return Hours(hours.value * double)
    }
    public static func *(double: Double, hours: Hours) -> Hours {
        return hours * double
    }
}

extension Hours: Comparable {
    public static func <(hours1: Hours, hours2: Hours) -> Bool {
        return hours1.value < hours2.value
    }
}

extension Double {
    public var hours: Hours {
        return  Hours(self)
    }
}

extension Int {
    public var hours: Hours {
        return  Hours(Double(self))
    }
}
