//
//  MessageViewController.swift
//  Doo2017
//
//  Created by Braver Chiang on 11/15/17.
//  Copyright © 2017 Braver Chiang. All rights reserved.
//

import UIKit
import GoogleSignIn
import Alamofire
import GTMOAuth2

class MessageViewController: UITableViewController{
    
    
    
//    let myUrl = "https://api.spotify.com/v1/search?q=Muse&type=track"
//    let myOauth = "Bearer BQDC6g5ITZtII6apVLK1FkKLeWBjcCMjawpUFRFFs-B4HSemi8ecdhoUBpc68dyokIcdDRTGBah9Kdpnej-rNI-qKVEnNqJ16Xeb7Qy5BvAWn1LYPyXAVpDLSLJYgVDhxss6YI5ZKIz8BA"
    
    let myUrlBing = "https://www.bing.com/images/search?q=reluctant&go=Search"

    var myAlbums = [MyAlbum]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        guard let url = URL(string: myUrl) else {return}
//        Alamofire.request(url, headers: ["authorization":  myOauth]).responseJSON { netData in
//            guard let data = netData.data else {return}
//            print(data)
//        }
//        print("responseString--------------------")
//        Alamofire.request(myUrlBing).responseString { (data) in
//            print(data.description )
//            print(data.response ?? "000")
//
//        }
        
        
        print("response--------------------")
        Alamofire.request(myUrlBing, encoding: JSONEncoding.default).responseData { (data) in
            if let netHTML = data.data,  let utf8NetHTML = String(data: netHTML , encoding: .utf8){
                
//                print(utf8NetHTML)
                do{
                    let jpgPattern = "(?<=<a class=\"thumb\" target=\"_blank\" href=\"http).[^ ]*?(?=.jpg)"

                    //(.*?)
                    let matcher: RegexHelper
                    matcher = try RegexHelper(jpgPattern)
                    let a = matcher.matches(for: jpgPattern, in: utf8NetHTML)
                    print(a)
                }catch{
                    print("error")
                }
            }
        }
        
//            //匹配的字符
//            let jpgPattern =
//            "^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$"
//            //把 匹配的字符 做成 匹配者
//            let matcher: RegexHelper
//            matcher = RegexHelper(jpgPattern)
//            if matcher.match(netHTML) {
//                print("netHTML中含有.jpg内容")
//            }
            // 输出:
            // 有效的邮箱地址
            
        
        
//        print("responseData--------------------")
//        Alamofire.request(myUrlBing).responseData { (data) in
//            print(data.description )
//            print(data.response ?? "222")
//        }
//        collectData()

        
        
    }
    
    func collectData() -> () {
        //调用函数: 实现网络请求, 数据解析, 数据装配, 并且搬到自己的"messages"上来
        MyAlbum.fromSpotify { (results: [MyAlbum]?) in
            guard let albums = results else {return}
            self.myAlbums = albums
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }
    }
    
    //tablenumber, tablecell, tableheight,
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myAlbums.count
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("MessageTableViewCell1", owner: self, options: nil)?.first as! MessageTableViewCell1
        cell.messageImageView.image = myAlbums[indexPath.row].myImage
        cell.messageLabel.text = myAlbums[indexPath.row].myName
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    

}



