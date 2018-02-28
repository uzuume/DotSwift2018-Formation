import Foundation

public protocol IndividualCurrency {
    static var conversionRateInDollars: Double {get}
    static var formatter: NumberFormatter {get}
}

extension IndividualCurrency {
    static func currencyFormatter(_ locale: Locale) -> NumberFormatter {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.numberStyle = .currency
        currencyFormatter.locale = locale
        return currencyFormatter
    }
}


