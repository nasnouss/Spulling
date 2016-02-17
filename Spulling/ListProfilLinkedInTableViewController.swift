//
//  ListProfilLinkedInTableViewController.swift
//  Spulling
//
//  Created by anis ben brahim on 14/02/2016.
//  Copyright © 2016 anis ben brahim. All rights reserved.
//

import UIKit
import Kanna

class ListProfilLinkedInTableViewController: UITableViewController {

 
    
    @IBOutlet var myTableView: UITableView!
    var arrayPerson: [Person] = [Person]()
    
    var list: [Person] = [Person]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    
        
        
print("im in the list section bitch bbbrraaaaaaaa")

       
        
        print("fin setUp")
        //print(list.first?.description)
        var person1 = Person(name: "anis", description: "description", image: "https://static.licdn.com/scds/common/u/images/themes/katy/ghosts/person/ghost_person_100x100_v1.png", url: "https://static.licdn.com/scds/common/u/images/themes/katy/ghosts/person/ghost_person_100x100_v1.png")
        
        list.append(person1)
        list.append(person1)
         list.append(person1)
        
        dispatch_async(dispatch_get_main_queue(), {
            
            self.myTableView.delegate = self;
            self.myTableView.dataSource = self;
            
        })

        
        
        
        
    }
    
    


    internal override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        print("yess")
       // print(list.count);
        
        return list.count;
    }
    
    internal override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cell: CustomCell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! CustomCell
        
       
        
        let person = list[indexPath.row];
        
        print("loading cells")
        
        cell.setCell("anis", description: "blablaalalala", image: "image")
       // cell.setCell(person.name, description: person.description, image: person.url)
        
        
        return cell
    }
    
    
 

   


}
