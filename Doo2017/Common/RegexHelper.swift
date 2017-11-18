//
//  RegexHelper.swift
//  Doo2017
//
//  Created by Braver Chiang on 11/17/17.
//  Copyright © 2017 Braver Chiang. All rights reserved.
//

import Foundation

struct RegexHelper {
    let regex: NSRegularExpression
    
    init(_ pattern: String) throws {
        try regex = NSRegularExpression(pattern: pattern,
                                        options: .caseInsensitive)
    }
    
    func match(input: String) -> Bool {
        let matches = regex.matches(in: input,
                                            options: [],
                                            range: NSMakeRange(0, input.utf8.count))
        return matches.count > 0
    }
    
    func matches(for regex: String, in text: String) -> [String] {//
        
        do {
            let regex = try NSRegularExpression(pattern: regex)
            let results = regex.matches(in: text,
                                        range: NSRange(text.startIndex..., in: text))
//            print(results.count)
//            print(results)
            return results.map {
                "http" + String(text[Range($0.range, in: text)!]) + ".jpg"
            }
        } catch let error {
            print("invalid regex: \(error.localizedDescription)")
            return []
        }
    }
}
