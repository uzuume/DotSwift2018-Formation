//: ### Mapping Optionals
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
                       .Tue: 10.hours, .Thu: 12.hours]

//func earningsFor(_ day: Weekdays) -> Euros? {
//    guard let hours = hoursForTheWeek[day] else {return nil}
//    return pay15for(hours)
//}

extension Optional {
    func changed<Output>(_ f: (Wrapped) -> Output) -> Output? {
        switch self {
        case .none:
            return .none
        case .some(let value):
            return .some(f(value))
        }
    }
}

//func earningsFor(_ day: Weekdays) -> Euros? {
//    return hoursForTheWeek[day].changed{pay15for($0)}
//}

//func earningsFor(_ day: Weekdays) -> Euros? {
//    return hoursForTheWeek[day].map{pay15for($0)}
//}

//func earningsFor(_ day: Weekdays) -> Euros {
//    return hoursForTheWeek[day].map{pay15for($0)} ?? Euros(0)
//}

//func earningsFor(_ day: Weekdays) -> Euros {
//    return pay15for(hoursForTheWeek[day] ?? 0.hours)
//}

func earningsFor(_ day: Weekdays) -> Euros {
    return pay15for(hoursForTheWeek[day, default: 0.hours])
}

earningsFor(.Mon)
earningsFor(.Wed)


//: [TOC](00TOC) - [Previous](@previous) - [Next](@next)

