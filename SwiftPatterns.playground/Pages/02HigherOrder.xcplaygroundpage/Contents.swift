//: ### Higher-Order Functions
//: [TOC](00TOC) - [Previous](@previous) - [Next](@next)

func pay(at rateInEuros: Euros.Rate,
         for hours: Hours) -> Euros {
    return rateInEuros * hours
}

func pay(at rateInEuros: Euros.Rate) -> (Hours) -> Euros {
    return {hours in rateInEuros * hours}
}

let pay15for = pay(at: 15.euros.perHour)

func apply(_ f: (Hours) -> Euros,
           to startingValue: Hours) -> Euros {
    return f(startingValue)
}

apply(pay15for,
      to: 3.5.hours)

apply({hours in pay15for(hours)},
      to: 3.5.hours)

func change(_ startingValue: Hours,
            using f: (Hours) -> Euros) -> Euros {
    return f(startingValue)
}

change(3.5.hours, using: pay15for)

change(3.5.hours, using: {hours in pay15for(hours)})

change(3.5.hours){hours in pay15for(hours)}

change(3.5.hours){hours in
    pay(at: 15.euros.perHour)(hours)
}


func changed<Input, Output>(_ input: Input,
                            using f: (Input) -> Output) -> Output {
    return f(input)
}
changed(3.5.hours){hours in
    pay(at: 15.euros.perHour)(hours)
}

3.5.hours |> pay(at:15.euros.perHour)

let result = changed(3.5.hours){pay(at: 15.euros.perHour)($0)}
result
pay(at: 15.euros.perHour)(3.5.hours)

//: [TOC](00TOC) - [Previous](@previous) - [Next](@next)

