import Foundation

public enum USDollar: IndividualCurrency{
    public static let conversionRateInDollars = 1.0
    public static let formatter = currencyFormatter(Locale(identifier: "en_US"))
}

public typealias USDollars = Currency<USDollar>
public typealias USDollarsPerHour = USDollars.Rate

extension Double {
    public var usdollars: USDollars {
        return USDollars(self)
    }
}
extension Int {
    public var usdollars: USDollars {
        return USDollars(Double(self))
    }
}


