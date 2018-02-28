//: ### Non-Container Map
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



struct weekDaysCalculation<Output>{
    let g : (Weekdays) -> Output
}

extension weekDaysCalculation{
    func map<TargetOutput> (_ f : @escaping (Output) -> TargetOutput ) -> weekDaysCalculation<TargetOutput>{
        return weekDaysCalculation<TargetOutput>(g:
            { x in f(self.g(x))
        })
    }
}



let hours = weekDaysCalculation<Hours>(g : {day in
    hoursForTheWeek[day, default : 0.hours]
})
let hoursAlt = weekDaysCalculation<Hours>{ day in
    hoursForTheWeek[day, default : 0.hours]
}
hours.map(pay15for).g(.Mon)
hours.g(.Mon)
hours.g(.Wed)

let pay = weekDaysCalculation<Euros>(g: { day in
    pay15for(hours.g(day))
})

pay.g(.Mon)
pay.g(.Wed)
//: [TOC](00TOC) - [Previous](@previous) - [Next](@next)
