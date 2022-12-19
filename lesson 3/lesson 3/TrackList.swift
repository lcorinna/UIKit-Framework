//
//  TrackList.swift
//  lesson 3
//
//  Created by Lashaun Corinna on 12/13/22.
//

import UIKit

class TrackList: UITableViewController {
    
    let imageNameArray = ["Phao 2 Phut Hon - James Edhan",
                          "I Knew You Were Trouble - Taylor Swift",
                          "Summer Days - Calvin Sparks",
                          "In Da Club - 50 Cent",
                          "Anymore - Monista",
                          "Take My Love - Plazma",
                          "Maniac - Michael Sembello",
                          "Forgiven - Sylver",
                          "Hensonn — Sahara",
                          "Call Me - plenka"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageNameArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Title", for: indexPath)
        cell.imageView?.image = UIImage(named: imageNameArray[indexPath.row])
        cell.textLabel?.text = imageNameArray[indexPath.row]
        cell.textLabel?.numberOfLines = 0
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let detailVC = segue.destination as! DetailVC
                detailVC.trackTitle = imageNameArray[indexPath.row]
            }
        }
    }
    
}
