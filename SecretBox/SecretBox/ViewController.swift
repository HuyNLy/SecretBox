//
//  ViewController.swift
//  SecretBox
//
//  Created by Huy Ly on 11/11/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {

    @IBOutlet var myTable: UITableView!
    @IBOutlet var myProfile: UIImageView!
    
    
    
    struct friends {
        let name: String
        let image: String
    }
    let data: [friends] = [
        friends(name: "John Cenna", image: "paper"),
        friends(name: "Taylor Swift", image: "paper"),
        friends(name: "John Cenna", image: "paper"),
       
    ]
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard myTable.indexPathForSelectedRow != nil else { return }

        // Get access to the detail view controller via the segue's destination. (guard to unwrap the optional)
        guard segue.destination is DetailMsg else { return }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        myTable.delegate = self
        myTable.dataSource = self
        
        myProfile.backgroundColor = .black
        myProfile.layer.masksToBounds = true
        myProfile.layer.cornerRadius = myProfile.frame.width / 2
        tapImage()
        print()

    }
    
    
    //change image profile
    //change image profile
    func tapImage(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(imgTapped))
        myProfile.isUserInteractionEnabled = true
        myProfile.addGestureRecognizer(tap)
    }
    
    @objc func imgTapped(_sender: UITapGestureRecognizer){
        let imgPicker = UIImagePickerController()
        imgPicker.delegate = self  // Set the delegate
        imgPicker.sourceType = .photoLibrary
        self.present(imgPicker, animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                myProfile.image = selectedImage
            }
            dismiss(animated: true, completion: nil)
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            dismiss(animated: true, completion: nil)
        }
       
    
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let friends = data[indexPath.row]
        let cell = UITableViewCell()
        cell.textLabel?.text = friends.name
        //cell.imageView?.layer.cornerRadius = 100
       // cell.imageView?.clipsToBounds = true

        cell.imageView?.image = UIImage(named: friends.image)
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "DetailMsg", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    //height of each cell
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    //show message chat

}

