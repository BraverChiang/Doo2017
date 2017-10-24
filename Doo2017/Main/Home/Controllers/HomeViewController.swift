//
//  One2ViewController.swift
//  Doo2017
//
//  Created by Braver Chiang on 10/14/17.
//  Copyright © 2017 Braver Chiang. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //1标题换成图标
        //self.navigationItem.titleView = UIImageView(image: UIImage(named: "logo"))
        
        //2返回键名称修改, 但是Code的优先级低, Board优先级高
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back1", style: .plain, target: nil, action: nil)
        
        //3滑动时隐藏Nav Bar
        self.navigationController?.hidesBarsOnSwipe = true
        
        self.tabBarController?.tabBar.isHidden = true

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
