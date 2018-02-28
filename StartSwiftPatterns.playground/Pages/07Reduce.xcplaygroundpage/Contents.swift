//: ### Reduce
//: [TOC](00TOC) - [Previous](@previous) - [Next](@next)

func pay15for(_ hours: Hours) -> Euros {
    return hours * 15.euros.perHour
}

func adjustedHoursForOvertime(_ hours: Hours) -> Hours {
    guard hours > 8.hours else {return hours}
    return hours + (hours - 8.hours) * 0.5
}

let hoursForTheWeek = [3.5.hours, 10.hours,
                       7.hours, 12.hours, 4.6.hours]


extension Sequence {
    func  trasform<Output> (_ initialValue : Output, using f : (Output, Element) -> Output) -> Output {
        var accumulator = initialValue
        for element in self {
            accumulator = f(accumulator, element)
           // n+ stage = f(nth stage , next element of the array)
        }
        
        return accumulator
    }
}

let totalHours = hoursForTheWeek.reduce(0.hours){(runningTotal, hoursForTheDay) in
    runningTotal + hoursForTheDay
}

let totalHoursa = hoursForTheWeek.reduce(0.hours){$0 + $1}
let totalHoursb = hoursForTheWeek.reduce(0.hours, +)

let totalPay = hoursForTheWeek.reduce(0.euros){(runningTotal, hourOfTheDay) in
    runningTotal + pay15for(hourOfTheDay)
}
// what about map ?????????????
let payAmount = hoursForTheWeek.reduce ([Euros]() ) { (accumulator , hoursOfTheDay) in
    accumulator + [pay15for(hoursOfTheDay)]
    
}

//: [TOC](00TOC) - [Previous](@previous) - [Next](@next)

