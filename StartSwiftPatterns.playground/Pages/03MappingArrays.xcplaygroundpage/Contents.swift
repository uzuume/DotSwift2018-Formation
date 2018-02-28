//: ### Mapping Arrays
//: [TOC](00TOC) - [Previous](@previous) - [Next](@next)

func changed<Input, Output>(_ input: Input,
using f: (Input) -> Output) -> Output {
    return f(input)
}

func pay15for(_ hours: Hours) -> Euros {
    return hours * 15.euros.perHour
}

let hoursForTheWeek = [3.5.hours, 10.hours,
                       7.hours, 12.hours,
                       4.6.hours]

//let result1 = changed(hoursForTheWeek){hours in pay15for(hours)}
//result1.description


extension Sequence {
    func changed<Output>(using f: (Element) -> Output) -> [Output] {
        
        var output = [Output]()
        for element in self {
            output.append(f(element))
        }
        return output
    }
}

/* wanted to do */
let result2 = hoursForTheWeek.changed{hours in pay15for(hours)}
result2.description

let result3 = hoursForTheWeek.map{hours in pay15for(hours)}
result3.description

let result4 = hoursForTheWeek.map{pay15for($0)}

let result5 = hoursForTheWeek.map(pay15for)


//infix operator <^>:  Compose
//public func <^><Input, Output> (xs : [Input], f : (Input) -> Output) -> [Output]{
//    return xs.map(f)
//}
//hoursForTheWeek <^> pay15for
//: [TOC](00TOC) - [Previous](@previous) - [Next](@next)

