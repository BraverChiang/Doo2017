//
//  NSDataDetector.swift
//  Doo2017
//
//  Created by Braver Chiang on 11/17/17.
//  Copyright © 2017 Braver Chiang. All rights reserved.
//

import Foundation

public class MatchHelper : NSRegularExpression {
    
    
    func matches(for regex: String, in text: String) -> [String] {
        
        do {
            let regex = try NSRegularExpression(pattern: regex)
            let results = regex.matches(in: text,
                                        range: NSRange(text.startIndex..., in: text))
            return results.map {
                String(text[Range($0.range, in: text)!])
            }
        } catch let error {
            print("invalid regex: \(error.localizedDescription)")
            return []
        }
    }
    // all instance variables are private
    /* NSDataDetector is a specialized subclass of NSRegularExpression. Instead of finding matches to regular expression patterns, it matches items identified by Data Detectors, such as dates, addresses, and URLs. The checkingTypes argument should contain one or more of the types NSTextCheckingTypeDate, NSTextCheckingTypeAddress, NSTextCheckingTypeLink, NSTextCheckingTypePhoneNumber, and NSTextCheckingTypeTransitInformation. The NSTextCheckingResult instances returned will be of the appropriate types from that list.
     */
    
//    init(types checkingTypes: NSTextCheckingTypes) throws
//    /**
//     匹配字符串中的URLS
//
//     - parameter str: 要匹配的字符串
//     */
//    private func getUrl(str:String) {
//        // 创建一个正则表达式对象
//        do {
//            let dataDetector = try NSDataDetector(types: NSTextCheckingResult.CheckingType(rawValue: NSTextCheckingResult.CheckingType.link.rawValue).rawValue)
//            // 匹配字符串，返回结果集
//            let res = dataDetector.matches(in: str, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, str.count))
//            // 取出结果
//            for checkingRes in res {
//                print((str as NSString).substring(with: checkingRes.range))
//            }
//        }
//        catch {
//            print(error)
//        }
//    }
    
}

