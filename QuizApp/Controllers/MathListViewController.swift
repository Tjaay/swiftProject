//
//  MathListViewController.swift
//  QuizApp
//
//  Created by Thomas Reeves on 2018-04-04.
//  Copyright © 2018 Thomas Reeves. All rights reserved.
//

import UIKit
import CoreData

class MathListViewController: UIViewController,UITableViewDataSource, UITableViewDelegate, MathQuizDelegate {
    
    var highScores = [HighScore]()
    
    var managedObjectContext: NSManagedObjectContext!

    override func viewDidLoad() {
        loadData()
        super.viewDidLoad()
        mathTableView.dataSource = self
        mathTableView.delegate = self
        
    }
    @IBOutlet weak var mathTableView: UITableView!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return highScores.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Configure the cell...
        let cell = tableView.dequeueReusableCell(withIdentifier: "highScore", for: indexPath)
        cell.textLabel!.text = highScores[indexPath.row].name 
        return cell
    }
    
    func mathQuizVC(_ control: MathQuizViewController, didAddScore item: HighScore) {
        let newRow = highScores.count;
        highScores.append(item)
        let indexPath = IndexPath(row: newRow, section: 0)
        mathTableView.insertRows(at: [indexPath], with: .automatic)
        
        navigationController?.popViewController(animated: true)
    }
    
    // Override to support editing the table view.
   func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            let highScore = highScores.remove(at: indexPath.row)
            managedObjectContext.delete(highScore)
            do {
                try managedObjectContext.save()
            } catch {
                print("Core data saving error")
            }
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mathQuiz" {
            let controller = segue.destination as! MathQuizViewController
            controller.delegate = self
            controller.managedObjectContext = managedObjectContext
        }
    }
    
    func loadData() {
        let fetchRequest = NSFetchRequest<HighScore>(entityName: "HighScore")
        do {
            highScores = try managedObjectContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Fetch Error \(error)")
        }
    

}
}
