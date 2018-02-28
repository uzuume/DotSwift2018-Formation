//: ### Higher-Order Functions
//: [TOC](00TOC) - [Previous](@previous) - [Next](@next)

func pay(at rateInEuros: Euros.Rate, for hours: Hours) -> Euros {
    return rateInEuros * hours
}

func pay(at rateInEuros: Euros.Rate) -> (Hours) -> Euros {
    return {hours in rateInEuros * hours}
}

let payAt15 = pay(at: 15.euros.perHour)

func apply(_ f:(Hours) -> Euros, to startingValue : Hours) -> Euros{
    return f(startingValue)
}

//apply({hours in payAt15(hours)}, to: 3.5.euros)
apply(payAt15, to: 3.5.hours)
//apply({hours in pay (at : 15.euros.perHour)}, to: 3.5.hours)

func change(_ startingValue : Hours , using f : (Hours) -> Euros) -> Euros{
    return f(startingValue)
}

/* same calls */
change(3.5.hours, using: payAt15)
change(3.5.hours, using: {hours in  payAt15(hours)})
change(3.5.hours) {hours in  payAt15(hours)}
change(3.5.hours) {payAt15($0)}

/* using generics */

func changed<Input, Output>(_ input : Input , using f : (Input) -> Output) -> Output {
    return f(input)
}

/* same calls */
changed(3.5.hours, using: payAt15)
changed(3.5.hours, using: {hours in  payAt15(hours)})
changed(3.5.hours) {hours in  payAt15(hours)}
changed(3.5.hours) {payAt15($0)}

/* custom operator */
3.5.hours |> payAt15
