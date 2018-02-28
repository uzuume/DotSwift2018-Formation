//: ### FlatMapping Sequences
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

let scheduleMap = schedule.map{(_ , days) in days}
print(scheduleMap)
print("=======")

let scheduleFlapMap = schedule.flatMap{(_ , days) in days }
print(scheduleFlapMap)

print(Set(scheduleFlapMap))

extension Sequence {
    func changed<Output>(_ f :(Element) ->  [Output]) ->[Output] {
        var output = [Output]()
        for element in self {
            output.append(contentsOf: f(element))
        }
        return output
    }
    
}
//: [TOC](00TOC) - [Previous](@previous) - [Next](@next)



