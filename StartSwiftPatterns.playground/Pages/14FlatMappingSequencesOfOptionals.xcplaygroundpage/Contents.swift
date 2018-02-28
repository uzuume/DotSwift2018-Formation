//: ### FlatMapping Sequences of Optionals
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

let team = ["Joan", "Mike", "Dave", "Anna"]

let daysForTeamMap = team.map{name in schedule[name]}
let daysForTeamMap2 = team.map{schedule[$0]}

print(daysForTeamMap)
print(daysForTeamMap2)

let daysForTeamFlapMap2 = team.flatMap{schedule[$0]}
print(daysForTeamFlapMap2)

let daysForTeamFlapperMapFlapper = daysForTeamFlapMap2.flatMap{$0}
print(daysForTeamFlapperMapFlapper)

extension Sequence { // named compactMap() swift 4.1
    func changed<Output> (_ f : (Element) -> Output?) -> [Output]{
        var output = [Output]()
        for element in self {
            if let newElement = f(element) {
                output.append(newElement)
            }
        }
        return output
    }
}
//: [TOC](00TOC) - [Previous](@previous) - [Next](@next)


