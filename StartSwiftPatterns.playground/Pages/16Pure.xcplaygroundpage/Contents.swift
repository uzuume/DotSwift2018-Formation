//: ### Unit
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
    static func pure(_ a : Element) -> [Element]{
        return [a]
    }
}

let fiveInt = Array.pure(5)
let fiveString = Array.pure("five")

extension Array {
    init (pure element : Element) {
        self = [element]
    }
}

// how you feel about it  :D ?
let fourInts = Array(pure : 4)
let fourStrings = Array(pure : "Four")

extension Array {
    func myMap <Output> (_ f : (Element) -> Output) -> [Output]{
        return flatMap { a  in Array<Output>.pure(f(a))}
    }
}
//: [TOC](00TOC) - [Previous](@previous) - [Next](@next)
