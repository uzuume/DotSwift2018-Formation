import Foundation

public enum Euro: IndividualCurrency{
    public static let conversionRateInDollars = 1.16
    public static let formatter = currencyFormatter(Locale(identifier: "en_IE"))
}

public typealias Euros = Currency<Euro>
public typealias EurosPerHour = Euros.Rate

extension Double {
    public var euros: Euros {
        return Euros(self)
    }
}

extension Int {
    public var euros: Euros {
        return Euros(Double(self))
    }
}
