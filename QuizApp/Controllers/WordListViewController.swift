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
    
     var highScores = [WordHighScore]()
    var managedObjectContext: NSManagedObjectContext!
     var theImage: UIImage?
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        wordTableView.dataSource = self
        wordTableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func wordQuizVC(_ control: WordQuizViewController, didAddScore item: WordHighScore) {
        let newRow = highScores.count;
        highScores.append(item)
        let indexPath = IndexPath(row: newRow, section: 0)
        wordTableView.insertRows(at: [indexPath], with: .automatic)
        navigationController?.popViewController(animated: true)
        photoAlert()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return highScores.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Configure the cell...
        let cell = tableView.dequeueReusableCell(withIdentifier: "wordHighScore", for: indexPath)
        let name = highScores[indexPath.row].name
        let score = highScores[indexPath.row].score
        let nameLabel = cell.viewWithTag(110) as! UILabel
        let scoreLabel = cell.viewWithTag(120) as! UILabel
        let imageView = cell.viewWithTag(130) as! UIImageView
        nameLabel.text = name
        scoreLabel.text = score
        imageView.image = highScores[indexPath.row].photoImage
        return cell
    }
    
 
    
    // Override to support editing the table view.
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            let highScore = highScores.remove(at: indexPath.row)
            highScore.removePhotoFile()
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
    
    func pickPhoto() {
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            showPhotoPickMenu()
        } else {
            pickFromAlbum()
        }
    }
    
    func pickFromAlbum() {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true, completion: nil)
    }
    
    func takePhotoWithCamera(){
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true, completion: nil)
    }
    
    func showPhotoPickMenu() {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let actCancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(actCancel)
        let actPhoto = UIAlertAction(title: "Take Photo", style: .default, handler: { _ in
            self.takePhotoWithCamera()
        })
        alert.addAction(actPhoto)
        let actLibrary = UIAlertAction(title: "Choose From Library", style: .default, handler: { _ in
            self.pickFromAlbum()
        })
        alert.addAction(actLibrary)
        present(alert, animated: true, completion: nil)
    }
    
    func photoAlert() {
        let alert = UIAlertController(title: "Would you like to add a photo?", message:
            nil, preferredStyle: UIAlertControllerStyle.alert)
        
        let yes = UIAlertAction(title: "Yes", style: .default,
                                handler: {(action:UIAlertAction!) in
                                    self.pickPhoto()
        })
        let no = UIAlertAction(title: "No", style: .default,
                               handler: nil)
        alert.addAction(yes)
        alert.addAction(no)
        present(alert, animated: true, completion: nil)
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
    
    
    func loadData() {
        let fetchRequest = NSFetchRequest<WordHighScore>(entityName: "WordHighScore")
        do {
            highScores = try managedObjectContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Fetch Error \(error)")
        }
    }
}

extension WordListViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let img = info[UIImagePickerControllerEditedImage] as! UIImage
        theImage = img
        if let image = theImage {
            if highScores[highScores.count - 1].hasPhoto {
                highScores[highScores.count - 1].photoID = HighScore.nextPhotoID() as NSNumber
            }
            if let data = UIImageJPEGRepresentation(image,  0.5) {
                do {
                    try data.write(to: highScores[highScores.count - 1].photoURL, options: .atomic)
                } catch {
                    print("Photo saving error")
                }
            }
        }
        do {
            try managedObjectContext.save()
        } catch {
            print("Core data saving error")
        }
        self.wordTableView.reloadData()
        dismiss(animated: true, completion: nil)
    }
}


