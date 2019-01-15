import Foundation


enum LogStrategy {
    case upperCase
    case lowerCase
    case capitalized
}

protocol LogProtocol {
    func log(_ message: String)
}

class LoggerFactory {
    
    func makeLogger(with startegy: LogStrategy) -> Logger {
        switch startegy {
        case .upperCase:
            return Logger(logFunction: {print($0.uppercased())})
        case .lowerCase:
            return Logger(logFunction: {print($0.lowercased())})
        case .capitalized:
            return Logger(logFunction: {print($0.capitalized)})
        }
    }
}

struct Logger: LogProtocol {
    let logFunction: (_ message: String) -> ()
    
    func log(_ message: String) {
        self.logFunction(message)
    }
}

let factory = LoggerFactory()
factory.makeLogger(with: .lowerCase).log("Hello how are you?")

