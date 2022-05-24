//
//  YQLogger.swift
//  Pods
//
//  Created by 王叶庆 on 2022/5/24.
//

import Foundation
import Logging

public struct YQLogger {
    public var logger: Logger!
    public init(_ logger: Logger? = Logger(label: "YQLogger")) {
        self.logger = logger
        #if DEBUG
            self.logger.logLevel = .debug
        #else
            self.logger.logLevel = .info
        #endif
    }

    @inlinable public func debug(_ message: @autoclosure () -> CustomStringConvertible, metadata: @autoclosure () -> Logging.Logger.Metadata? = nil, source: @autoclosure () -> String? = nil, file: String = #file, function: String = #function, line: UInt = #line) {
        assert(logger != nil, "请先设置 logger")
        logger.debug("\(message())", metadata: metadata(), source: source(), file: file, function: function, line: line)
    }

    @inlinable public func info(_ message: @autoclosure () -> CustomStringConvertible, metadata: @autoclosure () -> Logging.Logger.Metadata? = nil, source: @autoclosure () -> String? = nil, file: String = #file, function: String = #function, line: UInt = #line) {
        assert(logger != nil, "请先设置 logger")
        logger.info("\(message())", metadata: metadata(), source: source(), file: file, function: function, line: line)
    }

    @inlinable public func notice(_ message: @autoclosure () -> CustomStringConvertible, metadata: @autoclosure () -> Logging.Logger.Metadata? = nil, source: @autoclosure () -> String? = nil, file: String = #file, function: String = #function, line: UInt = #line) {
        assert(logger != nil, "请先设置 logger")
        logger.notice("\(message())", metadata: metadata(), source: source(), file: file, function: function, line: line)
    }

    @inlinable public func warning(_ message: @autoclosure () -> CustomStringConvertible, metadata: @autoclosure () -> Logging.Logger.Metadata? = nil, source: @autoclosure () -> String? = nil, file: String = #file, function: String = #function, line: UInt = #line) {
        assert(logger != nil, "请先设置 logger")
        logger.warning("\(message())", metadata: metadata(), source: source(), file: file, function: function, line: line)
    }

    @inlinable public func error(_ message: @autoclosure () -> CustomStringConvertible & Error, metadata: @autoclosure () -> Logging.Logger.Metadata? = nil, source: @autoclosure () -> String? = nil, file: String = #file, function: String = #function, line: UInt = #line) {
        assert(logger != nil, "请先设置 logger")
        logger.error("\(message())", metadata: metadata(), source: source(), file: file, function: function, line: line)
    }

    @inlinable public func error(_ message: @autoclosure () -> Error, metadata: @autoclosure () -> Logging.Logger.Metadata? = nil, source: @autoclosure () -> String? = nil, file: String = #file, function: String = #function, line: UInt = #line) {
        assert(logger != nil, "请先设置 logger")
        logger.error("\(message())", metadata: metadata(), source: source(), file: file, function: function, line: line)
    }

    @inlinable public func critical(_ message: @autoclosure () -> CustomStringConvertible, metadata: @autoclosure () -> Logging.Logger.Metadata? = nil, source: @autoclosure () -> String? = nil, file: String = #file, function: String = #function, line: UInt = #line) {
        assert(logger != nil, "请先设置 logger")
        logger.critical("\(message())", metadata: metadata(), source: source(), file: file, function: function, line: line)
    }
}
