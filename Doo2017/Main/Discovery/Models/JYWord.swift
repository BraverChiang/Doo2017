//
//  WordJson.swift
//  Doo2017
//
//  Created by Braver Chiang on 11/17/17.
//  Copyright © 2017 Braver Chiang. All rights reserved.
//
import Alamofire
import Foundation

struct WordJson: Decodable {
    
    let status_code: Int
    let data: WordData
}

struct WordData: Decodable {
    let id: Int //单词id
    let content: String //所查的单词
    let pronunciation: String //所查单词的音标
    
    let cn_definition: Cn_definition //中文词性, 意思
//    let definition: String //中文意思
    
//    let us_audio: URL //所查单词的美式发音
//    let en_definition: En_definition //英文词性, 意思
}

struct Cn_definition: Decodable {
//    let pos: String? //中文词性
    let defn: String
}

struct SentenceJson: Decodable{
    let status_code: Int
    let data: [SentenceData]
}

struct SentenceData: Decodable {
    let annotation: String //英文句子
    let translation: String //中文句子
}

struct JYWord{
    var wordSelf: String //单词
    var wordPronunciation: String //单词发音
//    var wordPos: String //词性
    var wordDefn: String //中文
    
    var wordImages: [UIImage]?
    
//    var wordUs_audio: URL
//    var wordEn_definition: String?
//    var wordEn_Sentence: String
//    var wordCn_Sentence: String
    

    
}




    



