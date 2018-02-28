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

struct dailyRecord<Value> {
    let day : Weekdays
    let value : Value
}

extension dailyRecord: CustomStringConvertible {
    var description: String {
        return "\(day): \(value)"
    }
}

typealias WorkRecord = dailyRecord<Hours>
typealias PayRecord = dailyRecord<Euros>

/* different implementation */
//struct WorkRecord {
//    let day: Weekdays
//    let hours: Hours
//}
//
//extension WorkRecord: CustomStringConvertible {
//    var description: String {
//        return "\(day): \(hours)"
//    }
//}

//struct PayRecord {
//    let day: Weekdays
//    let euros: Euros
//}
//
//extension PayRecord: CustomStringConvertible {
//    var description: String {
//        return "\(day): \(euros)"
//    }
//}

extension dailyRecord {
    
    func map<TargetValue>(_ f : (Value) -> TargetValue ) -> dailyRecord<TargetValue>  {
        return dailyRecord<TargetValue>(day : day , value : f(value))
    }
    
}

let workRecord = WorkRecord(day: .Mon, value: 3.5.hours)
let payRecord = PayRecord (day : workRecord.day , value: pay15for(workRecord.value))

let payRecord2 = workRecord.map(pay15for)

let records = Model(WorkRecord(day: .Mon, value: 3.5.hours),
                    WorkRecord(day: .Tue, value: 10.hours),
                    WorkRecord(day: .Wed, value: 7.hours),
                    WorkRecord(day: .Thu, value: 12.hours),
                    WorkRecord(day: .Fri, value: 4.6.hours))

let payRecord3 = records.map { record in
    record.map(pay15for)
}
//: [TOC](00TOC) - [Previous](@previous) - [Next](@next)


