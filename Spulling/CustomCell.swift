//
//  CustomCell.swift
//  Spulling
//
//  Created by anis ben brahim on 16/02/2016.
//  Copyright © 2016 anis ben brahim. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

   
    @IBOutlet weak var profilImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        
     
       
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func setCell(name: String, description:String, image:String){
        print("setCell1")
        
        self.nameLabel.text = name;
        self.descriptionLabel.text = description;
        
        
        
        let url = NSURL(fileURLWithPath: "https://static.licdn.com/scds/common/u/images/themes/katy/ghosts/person/ghost_person_100x100_v1.png")
      
        let data = NSData(contentsOfURL: url)
        
        
        
        
//        var imgURL: NSURL = NSURL(string: image)!
//        let request: NSURLRequest = NSURLRequest(URL: imgURL)
//        
//        NSURLConnection.sendSynchronousRequest(request, queue: NSOperationQueue.mainQueue()) { (response: NSURLResponse?, data: NSData?, error: NSError?) -> Void in
//            if error == nil {
//              //  self.profilImage.image = UIImage(data: data!)
//            }
//            
//        }
//        
     
       
        
      
        
        
      //  self.profilImage.image = UIImage(data: data!)
        
    }
    
    
    
    func setCellDump(name: String, description:String){
        
        
        self.nameLabel.text = name;
        self.descriptionLabel.text = description;
        
    
        
        
        
      
        
    }
    

}
