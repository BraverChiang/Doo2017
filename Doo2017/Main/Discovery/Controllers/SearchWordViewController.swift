//
//  SearchWordViewController.swift
//  Doo2017
//
//  Created by Braver Chiang on 11/18/17.
//  Copyright © 2017 Braver Chiang. All rights reserved.
//

import UIKit
import Alamofire

class SearchWordViewController: UIViewController, UISearchBarDelegate {

    @IBOutlet weak var searchWord: UISearchBar!
    
    @IBOutlet weak var spell: UILabel!
    @IBOutlet weak var pronounce: UILabel!
    @IBOutlet weak var pos: UILabel!
    @IBOutlet weak var meaning: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var imageA: UIImageView!
    @IBOutlet weak var imageC: UIImageView!
    
    
    
    @IBAction func storeWord(_ sender: Any) {
    }
    
    //    static var shanbaySentenceAPI = "https://api.shanbay.com/bdc/example/?vocabulary_id={id}&type=sys"
    
    var myWord: JYWord?
    var tupians: [UIImage] = []
    
    var searchIt: String?
    var imageBingAPI = ""
    var wordShanbayAPI = ""

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if searchBar.isFocused == true{
            self.myWord?.wordImages = []
        }
        
        self.view.endEditing(true)
        
        let keyword = searchBar.text
        let finalKeyword = keyword?.replacingOccurrences(of: " ", with: "+")
        searchIt = finalKeyword
        wordShanbayAPI = "https://api.shanbay.com/bdc/search/?word=\(searchIt ?? "cat")"
        imageBingAPI = "https://www.bing.com/images/search?q=\(searchIt ?? "dong")&go=Search"
        
       
        getStrings(api1: wordShanbayAPI, api2: imageBingAPI)
    }
    
    fileprivate func getStrings(api1: String, api2: String){
        DispatchQueue.global().async {
            //搜索单词, 并构造一个新的JYWord, 并存入self.myWord
            Alamofire.request(api1).responseJSON { (data) in
                guard let data = data.data else {return}
                print(data)
                do{
                    //解析:第一层
                    let wordJson = try JSONDecoder().decode(WordJson.self, from: data)
                    print("-----------\(wordJson)")
                    let yingwen = wordJson.data.content
                    let yinbiao = wordJson.data.pronunciation
                    //                    let cixing = wordJson.data.cn_definition.pos
                    let zhongwen = wordJson.data.cn_definition.defn
                    self.myWord = JYWord.init(wordSelf: yingwen, wordPronunciation: yinbiao, wordDefn: zhongwen, wordImages: self.tupians)
                    print(self.myWord ?? "00000000000")
                    self.loadUI(myWord: self.myWord!)
                    self.getImages(api2: api2, yingwen: yingwen, yinbiao: yinbiao, zhongwen: zhongwen)
                    
                }catch{
                    print("error 2222222222222")
                }
                
            }
        }
        
    }

    
    func getImages(api2: String, yingwen: String, yinbiao: String, zhongwen: String){
        DispatchQueue.global().async {
        
        //搜索图片, 并放在tupians里面
        Alamofire.request(api2, encoding: JSONEncoding.default).responseData { (data) in
            if let netHTML = data.data,  let utf8NetHTML = String(data: netHTML , encoding: .utf8){
                
                do{
                    let jpgPattern = "(?<=<a class=\"thumb\" target=\"_blank\" href=\"http).[^ ]*?(?=.jpg)"
                    let matcher: RegexHelper
                    matcher = try RegexHelper(jpgPattern)
                    let imageStrings = matcher.matches(for: jpgPattern, in: utf8NetHTML)
                    let num = imageStrings.count > 3 ? 3 : imageStrings.count
                    print(imageStrings)
                    for i in 0..<num {
                        let a = UIImage(data: try NSData(contentsOf: URL(string: imageStrings[i])!) as Data)!
                        let b = UIImage(data: UIImageJPEGRepresentation(a, 0.2)!)
                        self.tupians.append(b!)
                        print("==============================\(self.tupians.count)")
                        
                            self.myWord = JYWord.init(wordSelf: yingwen, wordPronunciation: yinbiao, wordDefn: zhongwen, wordImages: self.tupians)
                            print(self.myWord ?? "11111111111111")
                            self.loadUI(myWord: self.myWord!)
                        
                    }
                }catch{
                    print("error 11111111")
                }
            }
        }
        }
    }
    
    
    
    func loadUI(myWord: JYWord) -> () {
        DispatchQueue.main.async {
            if let myWord = self.myWord{
                self.spell.text =  myWord.wordSelf
                self.pronounce.text = myWord.wordPronunciation
                self.meaning.text = myWord.wordDefn
                
                switch myWord.wordImages?.count {
                case 1?:
                    self.imageA.image = myWord.wordImages?[0]
                    self.image.image =  #imageLiteral(resourceName: "default@1x")
                    self.imageC.image =  #imageLiteral(resourceName: "default@1x")
                case 2?:
                    self.imageA.image = myWord.wordImages?[0]
                    self.image.image =  myWord.wordImages?[1]
                    self.imageC.image =  #imageLiteral(resourceName: "default@1x")
                case 3?:
                    self.imageA.image = myWord.wordImages?[0]
                    self.image.image =  myWord.wordImages?[1]
                    self.imageC.image =  myWord.wordImages?[2]
                default:
                    self.imageA.image = #imageLiteral(resourceName: "default@1x")
                    self.image.image =  #imageLiteral(resourceName: "default@1x")
                    self.imageC.image =  #imageLiteral(resourceName: "default@1x")
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
}
