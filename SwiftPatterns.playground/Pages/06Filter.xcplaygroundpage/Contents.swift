//: ### Filter
//: [TOC](00TOC) - [Previous](@previous) - [Next](@next)

let hoursForTheWeek = [3.5.hours, 10.hours,
                       7.hours, 12.hours, 4.6.hours]

enum Weekdays: String, CustomStringConvertible {
    case Mon, Tue, Wed, Thu, Fri
    var description: String {
        return rawValue
    }
}

let hoursForTheWeekdays = [Weekdays.Mon: 3.5.hours,
                           .Tue: 10.hours, .Wed: 7.hours,
                           .Thu: 12.hours, .Fri: 4.6.hours]

extension Sequence {
    func keepIfSatisfies(_ condition: (Element) -> Bool) -> [Element] {
        var output = [Element]()
        for element in self {
            if condition(element) {
                output.append(element)
            }
        }
        return output
    }
}

let under8
    = hoursForTheWeek.keepIfSatisfies{hours in
        hours < 8.hours
    }
under8.description

let under8a = hoursForTheWeek.filter{hours in
                  hours < 8.hours
              }
under8a.description

let daysBeginningWithT
    = hoursForTheWeekdays
        .filter{(key, _) in
             key.description.first! == "T"
         }
daysBeginningWithT.description

let under8b = hoursForTheWeekdays.filter{$0.value < 8.hours}
under8b.description

//: [TOC](00TOC) - [Previous](@previous) - [Next](@next)
