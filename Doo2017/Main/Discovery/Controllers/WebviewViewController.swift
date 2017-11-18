//
//  WebviewViewController.swift
//  Doo2017
//
//  Created by Braver Chiang on 11/18/17.
//  Copyright © 2017 Braver Chiang. All rights reserved.
//

import UIKit
import WebKit

class WebviewViewController: UIViewController, UIDropInteractionDelegate ,UIDragInteractionDelegate {
    
    
    @IBOutlet weak var myImage: UIImageView!
    
    func dragInteraction(_ interaction: UIDragInteraction, itemsForBeginning session: UIDragSession) -> [UIDragItem] {
        
        let touchedPoint = session.location(in: self.view )
        if let touchedImageView = self.view.hitTest(touchedPoint, with: nil) as? UIImageView{
            let touchedImage = touchedImageView.image
            print(touchedImage!)
            
            
            let itemProvider = NSItemProvider(object: touchedImage!)
            
            let dragItem = UIDragItem(itemProvider: itemProvider)
            dragItem.localObject = touchedImageView
            return [dragItem]
        }
        return []
    }
    
    func dragInteraction(_ interaction: UIDragInteraction, previewForLifting item: UIDragItem, session: UIDragSession) -> UITargetedDragPreview? {
        return UITargetedDragPreview(view: item.localObject as! UIView)
    }

    
    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myImage.isUserInteractionEnabled = true
        webView.isUserInteractionEnabled = true
        view.addInteraction(UIDragInteraction(delegate: self))
        view.addInteraction(UIDropInteraction(delegate: self))
        
        myImage.image = #imageLiteral(resourceName: "default")
        let url: URL = URL(string: "https://www.bing.com/images/search?q=cat&go=Search")!
        let urlRequest: URLRequest = URLRequest(url: url)
        webView.load(urlRequest)
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
