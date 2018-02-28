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


enum Result<Value> {
    case error(Error)
    case success(Value)
}

extension String: Error {}

func hoursFor(_ day: Weekdays) -> Result<Hours> {
    guard let hours
        = hoursForTheWeek[day]
        else {return Result.error("Not scheduled on \(day).")}
    return Result.success(hours)
}

hoursFor(.Mon)
hoursFor(.Wed)

func earningsFor(_ hours: Result<Hours>) -> Result<Euros> {
    switch hours {
    case .error(let errorMessage):
        return Result.error(errorMessage)
    case .success(let value):
        return Result.success(pay15for(value))
    }
}


earningsFor(hoursFor(.Mon))
earningsFor(hoursFor(.Wed))

extension Result {
    func map<TargetValue>(_ f: (Value) -> TargetValue) -> Result<TargetValue> {
        switch self {
        case .error(let errorMessage):
            return Result<TargetValue>.error(errorMessage)
        case .success(let value):
            return Result<TargetValue>.success(f(value))
        }
    }
}

let monPay = hoursFor(.Mon).map{hours in pay15for(hours)}
monPay
let wedPay = hoursFor(.Wed).map{pay15for($0)}
wedPay
let thursPay = hoursFor(.Thu).map(pay15for)
thursPay

extension Dictionary where Key == Weekdays, Value == Hours  {
    func hoursFor(_ day: Weekdays) -> Result<Hours> {
        guard let hours = self[day] else {return Result.error("Not scheduled on \(day).")}
        return Result.success(hours)
    }
    
    func earningsFor(_ day: Weekdays,
                     at rate: Euros.Rate) -> Result<Euros> {
        return self.hoursFor(day).map(pay(at: rate))
    }
}

hoursForTheWeek.earningsFor(.Mon, at: 10.euros.perHour)
hoursForTheWeek.earningsFor(.Wed, at: 10.euros.perHour)



//: [TOC](00TOC) - [Previous](@previous) - [Next](@next)


