//: ### Mapping Model
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

let hoursForTheWeek = [Weekdays.Mon: 3.5.hours,
                       .Tue: 10.hours, .Wed: 7.hours,
                       .Thu: 12.hours, .Fri: 4.6.hours]

//: [TOC](00TOC) - [Previous](@previous) - [Next](@next)

