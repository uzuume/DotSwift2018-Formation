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

let daysForTeamMap = team.map{schedule[$0]}
daysForTeamMap

print(daysForTeamMap)

extension Sequence {
    func changed<Output>(_ f: (Element) -> Output?) -> [Output] {
        var output = [Output]()
        for element in self {
            if let newElement = f(element) {
                output.append(newElement)
            }
        }
        return output
    }
}

let daysForTeamChanged = team.changed{schedule[$0]}
daysForTeamChanged
print(daysForTeamChanged)

let daysForTeamFlatMap = team.flatMap{schedule[$0]}
daysForTeamFlatMap

let daysForTeamFilterMap
    = team.map{name in schedule[name]}
        .filter{days in days != nil}
        .map{value in value!}



let daysForTeam = team.flatMap{schedule[$0]}.flatMap{$0}
print(daysForTeam)

let daysJoined = daysForTeamFlatMap.joined()
print(daysJoined)

let daysJoinedArray = Array(daysJoined)
print(daysJoinedArray)

//: [TOC](00TOC) - [Previous](@previous) - [Next](@next)


