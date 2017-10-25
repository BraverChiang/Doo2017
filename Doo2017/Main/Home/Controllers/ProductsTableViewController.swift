//
//  ProductsTableViewController.swift
//  Doo2017
//
//  Created by Braver Chiang on 10/25/17.
//  Copyright © 2017 Braver Chiang. All rights reserved.
//

import UIKit

class ProductsTableViewController: UITableViewController {
    
    
    var productlines = ProductLine.getProductLines()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //自适应 行高
        tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableViewAutomaticDimension
        
        navigationItem.rightBarButtonItem = editButtonItem

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return productlines.count
    }

    //产品数量
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return productlines[section].products.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellOfProduct", for: indexPath) as! ProductTableViewCell

        //产品集合(餐车)(Model)中的某个位置的产品
        
//        //prodt相当于刚从"餐车"取出来的"菜"
//        let prodt = products[indexPath.row]
//        //product相当于"桌子的格子"收到的"菜"
//        cell.product = prodt
        
        let prodt = productlines[indexPath.section].products[indexPath.row]
        cell.product = prodt
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let productline = self.productlines[section]
        return productline.name
    }
    
    //前提: 有"渲染"代码
    //功能: 向左滑动Cell进行删除
    //位置: ViewController中
    
    // 可否编辑：Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    // 编辑：增加，删除。 Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            let productLine = productlines[indexPath.section]
            productLine.products.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)//Apple效果好, 推荐
            //tableView.reloadData()//youtube无动效, 不推荐.
            
            
        }
//        else if editingStyle == .insert {
//            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//            list.append("Jiang")//?
//            tableView.insertRows(at: [indexPath], with: .fade)//?
//        }
    }
    
//    //前提: 有"渲染"代码, canEdit是true
//    //功能: 手动排序
//    //位置: ViewController中
//    @IBOutlet weak var myTableView: UITableView!
//    @IBOutlet weak var myEditButton: UIBarButtonItem!
//
//    //进入排序状态
//    @IBAction func JEditBtn(_ sender: Any) {
//        if myTableView.isEditing {
//            myEditButton.title = "edit"
//
//            myTableView.setEditing(false, animated: false)
//        }else{
//            myEditButton.title = "done"
//            myTableView.setEditing(true, animated: false)
//        }
//
//    }
    // 可否排序 Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    
    // 执行排序 Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let item = productlines[fromIndexPath.section].products[fromIndexPath.row]
        productlines[fromIndexPath.section].products.remove(at: fromIndexPath.row)
        productlines[fromIndexPath.section].products.insert(item, at: to.row)
    }
    
    var selectedItem: Product?
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedItem = productlines[indexPath.section].products[indexPath.row]
        performSegue(withIdentifier: "SegueProductDetail", sender: self)
        //        // checkmark:
        //        if tableView.cellForRow(at: indexPath)?.accessoryType == UITableViewCellAccessoryType.checkmark{
        //            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.none
        //        }else{
        //            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.checkmark
        //        }
        
    }
    
    
    
    //功能: 向下一页面ProductDetailTableViewController传值
    //位置: Controller中
    //Oct 25, 2017  1:29 PM
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SegueProductDetail" {
            let productDetailTableViewController = segue.destination as! ProductDetailTableViewController
            productDetailTableViewController.product = selectedItem
        }

    }
    
    /*
     //下一页中代码参考
          */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
