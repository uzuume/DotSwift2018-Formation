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



let joansFirstMap = joan.map{$0.first}
joansFirstMap
//print(joansFirstMap)


extension Optional {
    func changed<Output>(_ f: (Wrapped) -> Output?) -> Output? {
        switch self {
        case .none:
            return .none
        case .some(let value):
            return f(value)
        }
    }
}

let joansFirstChanged = joan.changed{member in member.first}
joansFirstChanged
//print(joansFirstChanged)

let joansFirstFlatMap = joan.flatMap{member in member.first}
joansFirstFlatMap
//print(joansFirstFlatMap)

let joansFirstChained = joan?.first
//print(joansFirstChained)

let team = ["Joan", "Mike", "Dave", "Anna"]

extension String {
    func hasValueIn(_ dictionary: [String: [Weekdays]]) -> [Weekdays]? {
        return dictionary[self]
    }
}

let teamsFirstChained  = team.first?.hasValueIn(schedule)?.first

let teamsFirstFlatMap = team.first
    .flatMap{name in name.hasValueIn(schedule)}
    .flatMap{days in days.first}

//: [TOC](00TOC) - [Previous](@previous) - [Next](@next)




