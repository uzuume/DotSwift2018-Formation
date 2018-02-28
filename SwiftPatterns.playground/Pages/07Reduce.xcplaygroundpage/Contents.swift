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
    func transform<Output>(_ initialValue: Output, using f: (Output, Element) -> Output) -> Output {
        var accumulator = initialValue
        for element in self {
            accumulator = f(accumulator, element)
        }
        return accumulator
    }
}

let totalHours
    = hoursForTheWeek
        .transform(0.hours){(runningTotal, hoursForTheDay) in
            runningTotal + hoursForTheDay
         }
totalHours

let totalHoursa = hoursForTheWeek.transform(0.hours){ $0 + $1}
totalHoursa

let totalHours1
    = hoursForTheWeek
        .reduce(0.hours){(runningTotal, hoursForTheDay) in
            runningTotal + hoursForTheDay
         }
totalHours1

let totalHours1a = hoursForTheWeek.reduce(0.hours){ $0 + $1}
totalHours1a

let totalPay = pay15for(totalHours1)

let totalPay1
    = hoursForTheWeek
        .reduce(0.euros){(runningTotal, hoursForTheDay) in
            runningTotal + pay15for(hoursForTheDay)
}
totalPay1

let payWithOvertime
    = hoursForTheWeek
        .reduce(0.euros){(runningTotal, hoursForTheDay) in
            runningTotal
                + pay15for(adjustedHoursForOvertime(hoursForTheDay))}
payWithOvertime

let dailyPay
    = hoursForTheWeek
        .reduce([Euros]()){(outputArray, hoursForTheDay) in
            outputArray + [pay15for(hoursForTheDay)]}
dailyPay.description

extension Sequence {
    func mapWithReduce<Output>(_ f: (Element) -> Output) -> [Output] {
        return reduce([Output]()){(outputArray, element) in
            outputArray + [f(element)]
        }
    }
}

let dailyPay2 = hoursForTheWeek.mapWithReduce(pay15for)

let under8
    = hoursForTheWeek
        .reduce([Hours]()){guard $1 < 8.hours else {return $0}
                                               return $0 + [$1]}
under8.description

extension Sequence {
    func filterWithReduce(_ f: (Element) -> Bool) -> [Element] {
        return reduce([Element]()){(outputArray, element) in
            guard f(element) else {return outputArray}
            return outputArray + [element]
        }
    }
}
let under8a
    = hoursForTheWeek
        .filterWithReduce{hours in hours < 8.hours}

//: [TOC](00TOC) - [Previous](@previous) - [Next](@next)

