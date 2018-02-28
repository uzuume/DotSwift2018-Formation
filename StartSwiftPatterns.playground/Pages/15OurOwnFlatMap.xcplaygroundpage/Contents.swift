//: ### Our Own FlatMap
//: [TOC](00TOC) - [Previous](@previous) - [Next](@next)

func pay(at rateInEuros: Euros.Rate) -> (Hours) -> Euros {
    return {hours in rateInEuros * hours}
}
enum Weekdays: String, CustomStringConvertible {
    case Mon, Tue, Wed, Thu, Fri
    var description: String {
        return rawValue
    }
}

enum Result<Value> {
    case error(Error)
    case success(Value)
}
extension Result: CustomStringConvertible {
    var description: String {
        switch self {
        case .error(let errorMessage):
            return "(Error: \(errorMessage))"
        case .success(let value):
            return "(Success: \(value))"
        }
    }
}

extension Result {
    func map<TargetValue>(_ f: (Value) -> TargetValue) -> Result<TargetValue> {
    switch self {
    case .error(let errorMessage):
    return Result<TargetValue>.error(errorMessage)
    case .success(let value):
    return Result<TargetValue>.success(f(value))
    }
    }
    
    func flatMap<TargetValue>(_ f: (Value) -> Result<TargetValue>) -> Result<TargetValue> {
        switch self {
        case .error(let errorMessage):
            return Result<TargetValue>.error(errorMessage)
        case .success(let value):
            return f(value)
        }
    }
    
}
extension String: Error{}

let hoursForTheWeek = [Weekdays.Mon: 3.5.hours,
                       .Tue: 10.hours, .Thu: 12.hours,
                       .Fri: 0.hours]

func hoursWorkedOn(_ day: Weekdays) -> Result<Hours> {
    guard let hours = hoursForTheWeek[day] else { return Result.error("error on \(day)")}
    return Result.success(hours)
}
let monHours = hoursWorkedOn(.Mon)
let wedHours = hoursWorkedOn(.Wed)
let friHours = hoursWorkedOn(.Fri)

func pay15For(_ hours : Hours)-> Result<Euros> {
    guard hours > 0.hours  else { return Result.error("error")}
    return Result.success(hours * 15.euros.perHour)
}
//
let wrongMondayPay = monHours.map(pay15For)
let wrongWedPay = wedHours.map(pay15For)
//: [TOC](00TOC) - [Previous](@previous) - [Next](@next)



