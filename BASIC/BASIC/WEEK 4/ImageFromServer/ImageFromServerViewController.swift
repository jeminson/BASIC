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
    var idLabelArray = [Int]()
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
        
        cell.idLabel.text = String(idLabelArray[indexPath.row])
        cell.imgView.image = UIImage(data: data! as Data)
        
        return cell
    }
    
}

extension ImageFromServerViewController {
    
    func downloadJSON() {
        
        DispatchQueue.global(qos: .background).async {
            print("In background")
            guard let url = URL(string: self.urlString) else {return}
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard let dataResponse = data, error == nil else {
                    print(error?.localizedDescription ?? "Response Error")
                    return
                } // End guard let dataResponse
                do {
                    let jsonResponse = try JSONSerialization.jsonObject(with: dataResponse) as? [[String: Any]]
                    
                    for item in jsonResponse! {
                        if let idNum = item["id"] as? Int {
                            self.idLabelArray.append(idNum)
                        }
                        
                        if let thumbUrl = item["thumbnailUrl"] as? String {
                            self.imageArray.append(thumbUrl)
                        }
                    }
                    
                    DispatchQueue.main.async {
                        self.fetchDataTableView.reloadData()
                    }
                    
//                    OperationQueue.main.addOperation ({
//                        self.fetchDataTableView.reloadData()
//                    })
                } catch let parsingError {
                    print("Error", parsingError)
                } // do & catch
            } // End task
            task.resume()
        } // End DispatchQueue.global
    } // End downloadJSON()
} // End ImageFromServerViewController
