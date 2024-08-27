//
//  YQLogger.swift
//  Sparrow
//
//  Created by 王叶庆 on 2021/2/23.
//

import Foundation
import Logging
import os

public typealias Log = Logging.Logger
public struct ConsoleLogHandler: LogHandler {
  
    private static var logger: OSLog = OSLog(subsystem: Bundle.main.bundleIdentifier!, category: "console")
    private let label: String
    public var logLevel: Log.Level = .error
    public init(label: String, logLevel: Log.Level = .error) {
        self.label = label
        self.logLevel = logLevel
    }
    private var prettyMetadata: String?
    public var metadata = Logger.Metadata() {
        didSet {
            self.prettyMetadata = self.prettify(self.metadata)
        }
    }
    public subscript(metadataKey metadataKey: String) -> Log.Metadata.Value? {
        get {
            return self.metadata[metadataKey]
        }
        set {
            self.metadata[metadataKey] = newValue
        }
    }
    private func prettify(_ metadata: Log.Metadata) -> String? {
        return !metadata.isEmpty ? metadata.map { "\($0)=\($1)" }.joined(separator: " ") : nil
    }
    public func log(level: Log.Level,
                    message: Log.Message,
                    metadata: Log.Metadata?,
                    source: String,
                    file: String,
                    function: String,
                    line: UInt) {
        guard level >= logLevel else {return}
        let prettyMetadata = metadata?.isEmpty ?? true
            ? self.prettyMetadata
            : self.prettify(self.metadata.merging(metadata!, uniquingKeysWith: { _, new in new }))

        let message = "\(self.timestamp()) \(level) \(self.label) :\(prettyMetadata.map { " \($0)" } ?? "") \(message)\n"
        os_log("%{public}@", log: Self.logger, type: .error, message)
    }
    private func timestamp() -> String {
        var buffer = [Int8](repeating: 0, count: 255)
        var timestamp = time(nil)
        let localTime = localtime(&timestamp)
        strftime(&buffer, buffer.count, "%Y-%m-%dT%H:%M:%S%z", localTime)
        return buffer.withUnsafeBufferPointer {
            $0.withMemoryRebound(to: CChar.self) {
                String(cString: $0.baseAddress!)
            }
        }
    }
}

public struct YQLogger {
    public var logger: Log!
    
    @available(*, deprecated)
    public init(_ logger: Log? = nil) {
        self.logger = logger ?? Log(label: "YQLogger", factory: { label in
            Logging.MultiplexLogHandler([ConsoleLogHandler(label: label)])
        })
        #if DEBUG
            self.logger.logLevel = .debug
        #else
            self.logger.logLevel = .notice
        #endif
        
    }
    
    public init(label: String = "YQLogger") {
        self.logger = Log(label: label, factory: { label in
            Logging.MultiplexLogHandler([ConsoleLogHandler(label: label)])
        })
        #if DEBUG
            self.logger.logLevel = .debug
        #else
            self.logger.logLevel = .notice
        #endif
        
    }

    @inlinable public func debug(_ message: @autoclosure () -> CustomStringConvertible, metadata: @autoclosure () -> Log.Metadata? = nil, source: @autoclosure () -> String? = nil, file: String = #file, function: String = #function, line: UInt = #line) {
        assert(logger != nil, "请先设置 logger")
        logger.debug("\(message())", metadata: metadata(), source: source(), file: file, function: function, line: line)
    }

    @inlinable public func info(_ message: @autoclosure () -> CustomStringConvertible, metadata: @autoclosure () -> Log.Metadata? = nil, source: @autoclosure () -> String? = nil, file: String = #file, function: String = #function, line: UInt = #line) {
        assert(logger != nil, "请先设置 logger")
        logger.info("\(message())", metadata: metadata(), source: source(), file: file, function: function, line: line)
    }

    @inlinable public func notice(_ message: @autoclosure () -> CustomStringConvertible, metadata: @autoclosure () -> Log.Metadata? = nil, source: @autoclosure () -> String? = nil, file: String = #file, function: String = #function, line: UInt = #line) {
        assert(logger != nil, "请先设置 logger")
        logger.notice("\(message())", metadata: metadata(), source: source(), file: file, function: function, line: line)
    }

    @inlinable public func warning(_ message: @autoclosure () -> CustomStringConvertible, metadata: @autoclosure () -> Log.Metadata? = nil, source: @autoclosure () -> String? = nil, file: String = #file, function: String = #function, line: UInt = #line) {
        assert(logger != nil, "请先设置 logger")
        logger.warning("\(message())", metadata: metadata(), source: source(), file: file, function: function, line: line)
    }

    @inlinable public func error(_ message: @autoclosure () -> String, metadata: @autoclosure () -> Log.Metadata? = nil, source: @autoclosure () -> String? = nil, file: String = #file, function: String = #function, line: UInt = #line) {
        assert(logger != nil, "请先设置 logger")
        logger.error("\(message())", metadata: metadata(), source: source(), file: file, function: function, line: line)
    }

    @inlinable public func error(_ error: @autoclosure () -> Error, metadata: @autoclosure () -> Log.Metadata? = nil, source: @autoclosure () -> String? = nil, file: String = #file, function: String = #function, line: UInt = #line) {
        assert(logger != nil, "请先设置 logger")
        logger.error("\(error())", metadata: metadata(), source: source(), file: file, function: function, line: line)
    }

    @inlinable public func critical(_ message: @autoclosure () -> CustomStringConvertible, metadata: @autoclosure () -> Log.Metadata? = nil, source: @autoclosure () -> String? = nil, file: String = #file, function: String = #function, line: UInt = #line) {
        assert(logger != nil, "请先设置 logger")
        logger.critical("\(message())", metadata: metadata(), source: source(), file: file, function: function, line: line)
    }
}
