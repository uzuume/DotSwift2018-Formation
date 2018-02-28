//: ### Our Own Map
//: [TOC](00TOC) - [Previous](@previous) - [Next](@next)

func pay15for(_ hours: Hours) -> Euros {
    return hours * 15.euros.perHour
}

enum Weekdays: String, CustomStringConvertible {
    case Mon, Tue, Wed, Thu, Fri
    var description: String {
        return rawValue
    }
}
struct DailyRecord<Value> {
    let day: Weekdays
    let value: Value
}

extension DailyRecord: CustomStringConvertible {
    var description: String {
        return "\(day): \(value)"
    }
}
extension DailyRecord {
    func map<TargetValue>(_ f: (Value) -> TargetValue) -> DailyRecord<TargetValue> {
        return DailyRecord<TargetValue>(day: day, value: f(value))
    }
}

typealias WorkRecord = DailyRecord<Hours>
typealias PayRecord = DailyRecord<Euros>

let workRecord = WorkRecord(day: .Mon, value: 3.5.hours)
let payRecord = workRecord.map(pay15for)

let records = Model(WorkRecord(day: .Mon, value: 3.5.hours),
                    WorkRecord(day: .Tue, value: 10.hours),
                    WorkRecord(day: .Wed, value: 7.hours),
                    WorkRecord(day: .Thu, value: 12.hours),
                    WorkRecord(day: .Fri, value: 4.6.hours))

let payRecords = records.map{record in
    PayRecord(day: record.day, value: pay15for(record.value))
}

let payRecords2 = records.map{record in
    record.map(pay15for)
}


//: [TOC](00TOC) - [Previous](@previous) - [Next](@next)


