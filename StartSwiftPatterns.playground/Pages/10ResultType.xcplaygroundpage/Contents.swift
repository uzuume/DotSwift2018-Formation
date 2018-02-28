//: ### Result Type
//: [TOC](00TOC) - [Previous](@previous) - [Next](@next)

func pay15for(_ hours: Hours) -> Euros {
    return hours * 15.euros.perHour
}
func pay(at rateInEuros: Euros.Rate) -> (Hours) -> Euros {
    return {hours in rateInEuros * hours}
}
enum Weekdays: String, CustomStringConvertible {
    case Mon, Tue, Wed, Thu, Fri
    var description: String {
        return rawValue
    }
}
let hoursForTheWeek = [Weekdays.Mon: 3.5.hours,
                       .Tue: 10.hours, .Thu: 12.hours]

enum Result<Value>{
    case error(Error)
    case success(Value)
}


extension String : Error {}
func hoursFor (_ day : Weekdays) -> Result<Hours>{
    guard let hours = hoursForTheWeek[day]  else { return Result.error("not schedule on \(day)." )}
    return Result.success(hours)
}
hoursFor(.Mon)
hoursFor(.Wed)


extension Result {
    
    func map<TargetValue> (_ f: (Value) -> TargetValue) -> Result<TargetValue> {
        switch self {
                case .error(let errorMessage):
                    return Result<TargetValue>.error(errorMessage)
                case .success(let value):
                    return Result<TargetValue>.success(f(value))
                }
    }
}

let monPay = hoursFor(.Mon).map{hours in pay15for(hours)}
let monPay2 = hoursFor(.Mon).map{pay15for($0)}


/* different implementation */
//func earningsFor(_ hours : Result<Hours>) -> Result<Errors> {
//
//    switch hours {
//    case .error(let errorMessage):
//        return Result.error(errorMessage)
//    case .success(let value):
//        return Result.success(pay15for(value))
//    }
//}
//earningsFor(hoursFor(.Mon))
//earningsFor(hoursFor(.Wed))



//: [TOC](00TOC) - [Previous](@previous) - [Next](@next)


