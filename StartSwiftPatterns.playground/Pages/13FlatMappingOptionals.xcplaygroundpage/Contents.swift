//: ### FlatMapping Optionals
//: [TOC](00TOC) - [Previous](@previous) - [Next](@next)

enum Weekdays: String, CustomStringConvertible {
    case Mon, Tue, Wed, Thu, Fri
    var description: String {
        return rawValue
    }
}

let joansDays = [Weekdays.Mon, .Tue, .Fri]
let davesDays = [Weekdays.Tue, .Wed, .Fri]
let marysDays = [Weekdays.Mon, .Wed, .Fri]
let fredsDays = [Weekdays.Mon, .Tue, .Wed]

let schedule = ["Joan": joansDays, "Dave": davesDays,
                "Mary": marysDays, "Fred": fredsDays]


let joan = schedule["Joan"]
joan?.first
let joansFirstUsingMaps = joan.map{ days in days.first}
let joansFirstUsingFlatMaps = joan.flatMap{ days in days.first}

extension Optional {
    func changed<Output>(_ f:  (Wrapped) -> Output?) -> Output? {
        switch self {
        case .none:
            return .none
        case .some(let value):
            return f(value)
        }
    }
}
//: [TOC](00TOC) - [Previous](@previous) - [Next](@next)




