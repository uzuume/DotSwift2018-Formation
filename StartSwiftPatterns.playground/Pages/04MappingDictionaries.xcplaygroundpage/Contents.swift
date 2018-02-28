//: ### Mapping Dictionaries
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


let worstToFirst =  hoursForTheWeek.sorted { first , second in
    first.value.value < second.value.value
}
worstToFirst.description

let result1 = hoursForTheWeek.map {(day ,hours) in
    pay15for(hours)
}
result1.description

let result2 = hoursForTheWeek.map {(day , hours) in
    (day , pay15for(hours))
}
result2.description

let result3 = hoursForTheWeek.mapValues{ hours in pay15for(hours)}
result3.description


/*
 Notes 
 maps : Input / output  : - same number
                            - type may be different
 
 filter : Input/ output : - Type must be the same
                          - Number may be differt (<=)
 */
//: [TOC](00TOC) - [Previous](@previous) - [Next](@next)
