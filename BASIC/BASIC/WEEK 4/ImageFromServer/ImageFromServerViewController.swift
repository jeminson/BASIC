//
//  ImageFromServerViewController.swift
//  BASIC
//
//  Created by Je Min Son on 2018. 11. 6..
//  Copyright © 2018년 Je Min Son. All rights reserved.
//

import UIKit

class ImageFromServerViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var fetchDataTableView: UITableView!
    
    let urlString = "https://jsonplaceholder.typicode.com/albums/1/photos"
    var imageArray = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Image From Server"
        
        self.downloadJSON()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ImageFromServerTableViewCell") as! ImageFromServerTableViewCell
        
        let imgURL = NSURL(string: imageArray[indexPath.row])
        let data = NSData(contentsOf: (imgURL)! as URL)
        
        cell.imgView.image = UIImage(data: data! as Data)
        
        return cell
    }
    
    func downloadJSON() {
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with: (url)!, completionHandler: { (data, response, error) -> Void in
            
            if let jsonResponse = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [[String: Any]] {
                
                for item in jsonResponse! {
                    if let thumburl = item["thumbnailUrl"] as? String {
                        self.imageArray.append(thumburl)
                    }
                    
                    OperationQueue.main.addOperation ({
                        self.fetchDataTableView.reloadData()
                    })
                    
                    
                }
               
                
            }
    
        }).resume()
        
    }
    
    
    
    
    
    
}
//
//extension ImageFromServerViewController {
//
//    func downloadImage() {
//
//        DispatchQueue.global(qos: .background).async {
//            print("In background")
//            guard let url = URL(string: "https://jsonplaceholder.typicode.com/albums/1/photos") else {return}
//            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
//                guard let dataResponse = data,
//                    error == nil else {
//                        print(error?.localizedDescription ?? "Response Error")
//                        return }
//                do{
//
//                    let jsonResponse = try JSONSerialization.jsonObject(with:
//                        dataResponse) as? [[String: Any]]
//
//                    print("Downloaded image")
//
//                    for item in jsonResponse! {
//                        if let url = item["url"] as? String {
////                            print(url)
//                            self.imageArray.append(url)
//                        }
//                    }
//                    print(self.imageArray)
////
////                    OperationQueue.main.addOperation({
////                        self.tableView.reloadData()
////                    })
////
//                    DispatchQueue.main.async {
//                        print("dispatched to main")
//                        self.tableView.reloadData()
//                    }
//
//                } catch let parsingError {
//                    print("Error", parsingError)
//                }
//            }
//            task.resume()
//        }
//    }
//}

//
//
//func getImageFromServer() {
//
//    guard let url = URL(string: "https://jsonplaceholder.typicode.com/albums/1/photos") else {return}
//    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
//        guard let dataResponse = data,
//            error == nil else {
//                print(error?.localizedDescription ?? "Response Error")
//                return }
//        do{
//            let jsonResponse = try JSONSerialization.jsonObject(with:
//                dataResponse) as? [[String: Any]]
//
//            for item in jsonResponse! {
//                if let url = item["url"] as? String {
//
//                    DispatchQueue.main.async {
//                        //                            print("dispatched to main")
//                        self.imageArray.append(url)
//                        //self.afterJSON()
//                    }
//                }
//            }
//        } catch let parsingError {
//            print("Error", parsingError)
//        }
//    }
//    task.resume()
//}
