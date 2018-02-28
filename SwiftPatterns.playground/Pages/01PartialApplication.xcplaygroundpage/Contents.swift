//: ### Partial Application
//: [TOC](00TOC) - [Previous](@previous) - [Next](@next)

func payAt15(for hours: Hours) -> Euros {
    return hours * 15.euros.perHour
}

payAt15(for: 3.5.hours)

func payAt12(for hours: Hours) -> Euros {
    return hours * 12.euros.perHour
}

payAt12(for: 3.5.hours)

func pay(at rateInEuros: Euros.Rate,
         for hours: Hours) -> Euros {
    return rateInEuros * hours
}

pay(at: 15.euros.perHour,
    for: 3.5.hours)

func pay(at rateInEuros: Euros.Rate) -> (Hours) -> Euros {
    return {hours in rateInEuros * hours}
}

pay(at: 15.euros.perHour)(10.hours)

let pay15 = pay(at: 15.euros.perHour)
pay15(3.5.hours)

//: [TOC](00TOC) - [Previous](@previous) - [Next](@next)
