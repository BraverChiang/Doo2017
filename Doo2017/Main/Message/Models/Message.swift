//
//  Message.swift
//  Doo2017
//
//  Created by Braver Chiang on 11/16/17.
//  Copyright © 2017 Braver Chiang. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

//第1层
struct MessageJson: Decodable {
    let tracks: Tracks //
}

//第2层:
struct Tracks: Decodable {
    let href: URL
    let items: [Item]
    let limit: Int
}

//第3层: 是数组层
struct Item: Decodable {
    let album: Album
    let track_number: Int
}

//第4层: "生菜"
struct Album: Decodable {
    let name: String
    let images: [JImage]
    
}

//第5层: 是数组层, TableView要用的就是数组层
struct JImage: Decodable {
    let url: URL
    let height: Int
    let width: Int
}

//与第4层对应的最终的: "熟菜"
struct MyAlbum {
    let myName: String
    let myImage: UIImage
    
    static let myUrl = "https://api.spotify.com/v1/search?q=Muse&type=track"
    static let myOauth  = "Bearer BQDC6g5ITZtII6apVLK1FkKLeWBjcCMjawpUFRFFs-B4HSemi8ecdhoUBpc68dyokIcdDRTGBah9Kdpnej-rNI-qKVEnNqJ16Xeb7Qy5BvAWn1LYPyXAVpDLSLJYgVDhxss6YI5ZKIz8BA"
    
    static func fromSpotify(complietion: @escaping ([MyAlbum])->()){ //111
        var myAlbum: [MyAlbum] = [] //222
        
        guard let url = URL(string: myUrl) else {return}
        
        Alamofire.request(url, headers: ["authorization": myOauth]).responseJSON { netData in
            //Alamofire文档
            guard let data = netData.data else {return}
            do{
                //解析:第一层
                let messageJson = try JSONDecoder().decode(MessageJson.self, from: data)
                //解析:第三层
                let items = messageJson.tracks.items
                for item in items{
                    //解析: 第五层
                    let name = item.album.name
                    let url = item.album.images[0].url
                    print(url)
                    let image = UIImage(data: NSData(contentsOf: url)! as Data)!
                    //下面开始做菜, 返回:第四层
                    myAlbum.append(MyAlbum.init(myName: name, myImage: image)) //333
                    
                }
            }catch{
            }
            complietion(myAlbum) //444
        }
    }
}






