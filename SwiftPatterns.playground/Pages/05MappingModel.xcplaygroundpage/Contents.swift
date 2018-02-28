//: ### Mapping Model
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

let hoursForTheWeek = [Weekdays.Mon: 3.5.hours,
                       .Tue: 10.hours, .Wed: 7.hours,
                       .Thu: 12.hours, .Fri: 4.6.hours]

struct WorkRecord {
    let day: Weekdays
    let hours: Hours
}

extension WorkRecord: CustomStringConvertible {
    var description: String {
        return "\(day): \(hours)"
    }
}

let exampleRecord = WorkRecord(day: .Mon, hours: 3.5.hours)

let records = Model(WorkRecord(day: .Mon, hours: 3.5.hours),
                    WorkRecord(day: .Tue, hours: 10.hours),
                    WorkRecord(day: .Wed, hours: 7.hours),
                    WorkRecord(day: .Thu, hours: 12.hours),
                    WorkRecord(day: .Fri, hours: 4.6.hours))

let alphabeticalDays = records.sorted{(record1, record2) in
    record1.day.rawValue < record2.day.rawValue
    }
alphabeticalDays.description

let worstToFirst = records.sorted{(record1, record2) in
    record1.hours < record2.hours}
worstToFirst.description

let justHours = records.map{record
    in record.hours
}

let orderedHours
    = records
        .sorted{(record1, record2) in
                 record1.hours < record2.hours
        }
        .map{record in record.hours}

let orderedHours2 = records
    .sorted{$0.hours < $1.hours}
    .map{record in record.hours}

struct PayRecord {
    let day: Weekdays
    let euros: Euros
}

extension PayRecord: CustomStringConvertible {
    var description: String {
        return "\(day): \(euros)"
    }
}

let payRecords = records.map{record in
    PayRecord(day: record.day, euros: pay15for(record.hours))
}

payRecords.description

//: [TOC](00TOC) - [Previous](@previous) - [Next](@next)

