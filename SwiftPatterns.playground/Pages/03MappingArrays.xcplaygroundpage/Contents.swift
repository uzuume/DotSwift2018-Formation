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

func changed<Input, Output>(_ input: [Input],
                            using f: (Input) -> Output) -> [Output] {
    var output = [Output]()
    for element in input {
        output.append(f(element))
    }
    return output
}

let result1 = changed(hoursForTheWeek){pay15for($0)}
result1.description

//extension Array {
//    func changed<Output>(using f: (Element) -> Output) -> [Output] {
//        var output = [Output]()
//        for element in self {
//            output.append(f(element))
//        }
//        return output
//    }
//}

extension Sequence {
    func changed<Output>(using f: (Element) -> Output) -> [Output] {
        var output = [Output]()
        for element in self {
            output.append(f(element))
        }
        return output
    }
}

let result2 = hoursForTheWeek.changed{pay15for($0)}
result2.description

let result3 = hoursForTheWeek.map{pay15for($0)}
result3

infix operator <^>: Compose

public func <^> <Input, Output>(xs: [Input], f: (Input) -> Output) -> [Output] {
    return xs.map(f)
}

let result4 = hoursForTheWeek <^> pay15for
result4.description


//: [TOC](00TOC) - [Previous](@previous) - [Next](@next)

