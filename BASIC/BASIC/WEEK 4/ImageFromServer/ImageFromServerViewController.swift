//
//  ImageFromServerViewController.swift
//  BASIC
//
//  Created by Je Min Son on 2018. 11. 6..
//  Copyright © 2018년 Je Min Son. All rights reserved.
//

import UIKit

class ImageFromServerViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var imageArray = [String]()
    
    func getImageFromServer() {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/albums/1/photos") else {return}
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let dataResponse = data,
                error == nil else {
                    print(error?.localizedDescription ?? "Response Error")
                    return }
            do{
                let jsonResponse = try JSONSerialization.jsonObject(with:
                dataResponse) as? [[String: Any]]
                
                for item in jsonResponse! {
                    if let url = item["url"] as? String {
                        self.imageArray.append(url)
                    }
                }
            } catch let parsingError {
                print("Error", parsingError)
            }
        }
        task.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ImageFromServerTableViewCell") as! ImageFromServerTableViewCell
        
        
        return cell
    }
    

    

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Image From Server"
        
        getImageFromServer()
        
        print(imageArray)
        
    }
    

   

}
