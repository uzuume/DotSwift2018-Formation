import Foundation

public enum Pound: IndividualCurrency{
    public static let conversionRateInDollars = 1.31
    public static let formatter = currencyFormatter(Locale(identifier: "en_UK"))
}

public typealias Pounds = Currency<Pound>
public typealias PoundsPerHour = Pounds.Rate

extension Double {
    public var pounds: Pounds {
        return Pounds(self)
    }
}

extension Int {
    public var pounds: Pounds {
        return Pounds(Double(self))
    }
}

