import Foundation

// Пространство имён для общих типов и утилит проекта - расширения, логгеры, хелперы
enum SWIFTFriends {

    // Простой логгер, который можно заменить на os_log / print
    static func log(_ message: String, file: String = #file, line: Int = #line) {
        #if DEBUG
        let fileName = (file as NSString).lastPathComponent
        print("[\(fileName):\(line)] \(message)")
        #endif
    }
}
