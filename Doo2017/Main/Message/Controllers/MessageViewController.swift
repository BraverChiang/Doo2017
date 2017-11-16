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
    

    var myAlbums = [MyAlbum]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        guard let url = URL(string: myUrl) else {return}
//        Alamofire.request(url, headers: ["authorization":  myOauth]).responseJSON { netData in
//            guard let data = netData.data else {return}
//            print(data)
//        }
        collectData()
        
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



