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


struct WeekdaysCalculation<Output> {
    let g: (Weekdays) -> Output
}

let hours = WeekdaysCalculation<Hours>(g: {day in
    hoursForTheWeek[day, default: 0.hours]})

let hours2 = WeekdaysCalculation<Hours>{day in
    hoursForTheWeek[day, default: 0.hours]}

hours.g(.Mon)
hours.g(.Wed)

let pay = WeekdaysCalculation<Euros>{day in
    pay15for(hours.g(day))
}

pay.g(.Mon)
pay.g(.Wed)

extension WeekdaysCalculation {
    func map<TargetOutput>(_ f: @escaping (Output) -> TargetOutput) -> WeekdaysCalculation<TargetOutput> {
        return WeekdaysCalculation<TargetOutput>{x in f(self.g(x))}
    }
}

hours.map(pay15for).g(.Mon)
hours.map(pay15for).g(.Wed)

hours.map{hoursWorked in
    hoursWorked.value == 0 ? "Didn't work"
                           : "worked \(hoursWorked)"}
    .g(.Mon)
hours.map{hoursWorked in
    hoursWorked.value == 0 ? "Didn't work"
                           : "worked \(hoursWorked)"}
    .g(.Wed)

let workedOrDidnt = hours.map{hoursWorked in
    hoursWorked.value == 0 ? "Didn't work"
        : "worked \(hoursWorked)"}

workedOrDidnt.g(.Mon)

workedOrDidnt.g(.Wed)

typealias AltWeekdaysCalculation<A> = (Weekdays) -> A

func map<A,B>(_ g: @escaping AltWeekdaysCalculation<A>,
              _ f: @escaping (A) -> B) -> AltWeekdaysCalculation<B> {
    return {x in f(g(x))}
}

let amountPaidOn = map({day in
    hoursForTheWeek[day, default: 0.hours]},
                       pay15for)

amountPaidOn(.Mon)
amountPaidOn(.Wed)


//: [TOC](00TOC) - [Previous](@previous) - [Next](@next)
