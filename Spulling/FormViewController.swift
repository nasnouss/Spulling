//
//  FormViewController.swift
//  Spulling
//
//  Created by anis ben brahim on 14/02/2016.
//  Copyright © 2016 anis ben brahim. All rights reserved.
//

import UIKit
import Kanna

class FormViewController: UIViewController{

    @IBOutlet weak var importButton: UIButton!
     var arrayOfPerson: [Person] = [Person]()
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    

       //@IBAction func ImportButtonAction(sender: AnyObject) {
    
    
    func setUp(){
        print("on est dans la focntionnnnn")
        
        
        
        let myUrl = NSURL(string: "https://www.linkedin.com/pub/dir/Anis/Ben+Brahim");
        let request = NSMutableURLRequest(URL:myUrl!);
        request.HTTPMethod = "GET";
        
        // Compose a query string
        
        
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
            data, response, error in
            
            if error != nil
            {
                print("error=\(error)")
                return
            }
            
            
            // Print out response body
            let responseString = NSString(data: data!, encoding: NSUTF8StringEncoding)
            //          //  print("responseString = \(responseString)")
            //
            //
            //         /* $$$$$$$$$$$ START PARSING $$$$$$$$$$ */
            //
            //
            var textHtml = responseString! as String
            //
            //
            do {
                //
                if let doc = Kanna.HTML(html: textHtml, encoding: NSUTF8StringEncoding) {
                    //
                    //
                    //
                    //                // on prend le nombre de personnes
                    var count =  doc.xpath("//div[@class='profile-card']").count
                    //                print(count);
                    //
                    //
                    var drap = 0 ;
                    //
                    var divs  = doc.xpath("//div[@class='profile-card']");
                    //
                    for index in 0...count-1 {
                        //print(index);
                        //
                        var textNode = divs.at(index)!.innerHTML;
                        //
                        
                        //
                        if textNode!.rangeOfString("headline") == nil{
                            drap++;
                            
                        }
                        var desciption = divs.at(0)!.xpath("//p[@class='headline']").at(index-drap)
                        
                        var link = divs.at(0)!.xpath("//a[@class='profile-img']").at(index);
                        
                        
                        
                        var image = divs.at(0)!.xpath("//img[@class='image']").at(index);
                        
                        
                        
                        var name = divs.at(0)!.xpath("//div/h3/a").at(index);
                        
                        
                        
                        let PDescription:String = (desciption!.innerHTML)!
                        let PName:String = (name!.innerHTML)!
                        let PImage:String = (image!["src"])!
                        let PUrl:String = (link!["href"])!
                        
                        
                        
                        
                        //                        print(PDescription);
                        //                        print(PName);
                        //                        print(PImage);
                        //                        print(PUrl);
                        
                        
                        
                        
                        var person1 = Person(name: PName, description: PDescription, image: PImage, url: PUrl)
                        
                        
                        print("tototo" + (person1.description))
                        
                        self.arrayOfPerson.append(person1)
                        print(self.arrayOfPerson.first?.url)
                        
                    }
                   
                }
                
              // self.performSegueWithIdentifier("goTo", sender: nil)
                
            } catch let error {
                print(error)
            }
           
        }
        
      
        
        dispatch_async(dispatch_get_main_queue(), {
            
              task.resume()
            
        })
        
        //performSegueWithIdentifier("goTo", sender: nil)
  
    }

  
    


    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        self.setUp();
        
        var secondVC: ListProfilLinkedInTableViewController = segue.destinationViewController as! ListProfilLinkedInTableViewController
        
        secondVC.list = self.arrayOfPerson
    }
    
    
    


}
