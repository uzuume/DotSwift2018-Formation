//: ### Pure
//: [TOC](00TOC) - [Previous](@previous) - [Next](@next)

func pay15for(_ hours: Hours) -> Euros {
    return hours * 15.euros.perHour
}

enum Weekdays: String, CustomStringConvertible {
    case Mon, Tue, Wed, Thu, Fri
    var description: String {
        return rawValue
    }
}

let hoursArray = [3.5.hours, 10.hours,
                  7.hours, 12.hours, 4.6.hours]

let hoursDictionary = [Weekdays.Mon: 3.5.hours,
                       .Tue: 10.hours, .Thu: 12.hours]

extension Array {
    static func pure(_ a: Element) -> [Element] {
        return [a]
    }
}


let fiveHours = Array.pure(5.hours)
let fiveInts = Array.pure(5)
let fiveStrings = Array.pure("five")

extension Array {
    init(pure element: Element) {
        self = [element]
    }
}

let fiveHoursAlt = Array(pure: 5.hours)
let fiveIntsAlt = Array(pure: 5)
let fiveStringsAlt = Array(pure: "five")


extension Array {
    func myMap<Output>(_ f: (Element) -> Output) -> [Output] {
        return flatMap{a in Array<Output>(pure: f(a))}
    }
}

let pay = hoursArray.myMap(pay15for)
pay.description

extension Optional {
    static func pure(_ a: Wrapped) -> Wrapped? {
        return .some(a)
    }
}

let optionalFiveHours = Optional.pure(5.hours)

extension Optional {
    init(pure element: Wrapped) {
        self = Optional.some(element)
    }
}

let optionalFiveHoursAlt = Optional(pure: 5.hours)


extension Optional {
    func myMap<Output>(_ f: (Wrapped) -> Output) -> Output? {
        return flatMap{a in Optional<Output>.pure(f(a))}
    }
}

let mondayPay = hoursDictionary[.Mon].myMap{pay15for($0)}
mondayPay

let wednesdayPay = hoursDictionary[.Wed].myMap{pay15for($0)}
wednesdayPay

enum Result<Value> {
    case error(Error)
    case success(Value)
}
extension Result: CustomStringConvertible {
    var description: String {
        switch self {
        case .error(let errorMessage):
            return "(Error: \(errorMessage))"
        case .success(let value):
            return "(Success: \(value))"
        }
    }
}

extension Result {
    func map<TargetValue>(_ f: (Value) -> TargetValue) -> Result<TargetValue> {
        switch self {
        case .error(let errorMessage):
            return Result<TargetValue>.error(errorMessage)
        case .success(let value):
            return Result<TargetValue>.success(f(value))
        }
    }
    
    func flatMap<TargetValue>(_ f: (Value) -> Result<TargetValue>) -> Result<TargetValue> {
        switch self {
        case .error(let errorMessage):
            return Result<TargetValue>.error(errorMessage)
        case .success(let value):
            return f(value)
        }
    }
    static func pure(_ a: Value) -> Result<Value> {
        return Result.success(a)
    }
    func myMap<TargetValue>(_ f: (Value) -> TargetValue) -> Result<TargetValue> {
        return flatMap{ a in Result<TargetValue>.pure(f(a))}
    }
}
extension String: Error{}
//: [TOC](00TOC) - [Previous](@previous) - [Next](@next)
