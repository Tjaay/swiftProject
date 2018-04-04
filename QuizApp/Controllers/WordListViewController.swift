//
//  WordListViewController.swift
//  QuizApp
//
//  Created by Thomas Reeves on 2018-04-04.
//  Copyright © 2018 Thomas Reeves. All rights reserved.
//

import UIKit
import CoreData 

class WordListViewController: UIViewController,UITableViewDataSource, UITableViewDelegate, WordQuizDelegate {

    @IBOutlet weak var wordTableView: UITableView!
    
    var managedObjectContext: NSManagedObjectContext!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        wordTableView.dataSource = self
        wordTableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func wordQuizVC(_ control: WordQuizViewController, didAddScore item: HighScore) {
        
    }

    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "wordQuiz" {
            let controller = segue.destination as! WordQuizViewController
            controller.delegate = self
            controller.managedObjectContext = managedObjectContext
        }
    }

}
