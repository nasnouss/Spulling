//
//  ViewController.swift
//  Spulling
//
//  Created by anis ben brahim on 14/02/2016.
//  Copyright © 2016 anis ben brahim. All rights reserved.
//

import UIKit
import Kanna

class ViewController: UIViewController {

    @IBOutlet weak var testButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func testButtonAction(sender: AnyObject) {
        let filename = "test_HTML4"
        guard let path = NSBundle(forClass:self.classForCoder).pathForResource(filename, ofType:"html") else {
            return
        }
        
        do {
            let html = try String(contentsOfFile: path, encoding: NSUTF8StringEncoding)
            guard let doc = HTML(html: html, encoding: NSUTF8StringEncoding) else {
                return
            }
            print(doc.title)
            
            for link in doc.xpath("//a | //link") {
                print(link.text)
            //    print(link["href"])
            }
            
        } catch {
            
        }
    }

}

