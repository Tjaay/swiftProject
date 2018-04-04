//
//  FirstViewController.swift
//  QuizApp
//
//  Created by Thomas Reeves on 2018-04-03.
//  Copyright © 2018 Thomas Reeves. All rights reserved.
//

import UIKit
import CoreData

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var managedObjectContext: NSManagedObjectContext!

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "quizType" {
            let controller = segue.destination as! QuizTypeViewController
            controller.managedObjectContext = managedObjectContext
        }
    }
}

