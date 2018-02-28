//: ### Partial Application
//: [TOC](00TOC) - [Previous](@previous) - [Next](@next)
func payAt15(for hours :Hours) -> Euros {
    return hours * 15.euros.perHour
}
payAt15(for: 3.5.hours)

func payAt12(for hours :Hours) -> Euros {
    return hours * 12.euros.perHour
}

payAt12(for: 3.5.hours)

func payTraditional(at rateInEuros: Euros.Rate ,for hours : Hours) -> Euros {
    return rateInEuros * hours
    
}
payTraditional(at: 15.euros.perHour, for: 3.5.hours)
/* different way to implement fonction in fonction (closure) */

/* this will be equalt to this part */

//func pay(at rateInEuros : Euros.Rate) -> (Hours) -> Euros {
//    func payCalculation(hours : Hours) -> Euros {
//        let amoutOfPay = rateInEuros * hours
//        return amoutOfPay
//    }
//    return payCalculation
//}


//func pay(at rateInEuros : Euros.Rate) -> (Hours) -> Euros {
//    let payCalculation = {(hours : Hours) -> Euros in
//        let amoutOfPay = rateInEuros * hours
//        return amoutOfPay
//    }
//    return payCalculation
//}

//func pay(at rateInEuros : Euros.Rate) -> (Hours) -> Euros {
//    return {(hours : Hours) -> Euros in
//        let amoutOfPay = rateInEuros * hours
//        return amoutOfPay
//    }
//}

//func pay(at rateInEuros : Euros.Rate) -> (Hours) -> Euros {
//    return {hours -> Euros in
//        return rateInEuros * hours
//    }
//}

func pay(at rateInEuros : Euros.Rate) -> (Hours) -> Euros {
    //    return {hours in rateInEuros * hours}
    return {rateInEuros * $0}
}






let result = pay(at: 15.euros.perHour)
let peyamount = result(3.5.hours)
//let altPay = pay(at: 15.euros.perHour)(3.5.hours)

//pay(at: 15.euros.perHour)(for: 3.5.hours)
//
//let payAt15euros = pay(at: 15.euros.perHour)
//payAt15(for: 3.5.euros)

////: [TOC](00TOC) - [Previous](@previous) - [Next](@next)

