//
//  SearchController.swift
//  SecretBox
//
//  Created by Huy Ly on 11/14/23.
//

import UIKit

class SearchController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {

    @IBOutlet weak var myProfile: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

       
        myProfile.backgroundColor = .black
        myProfile.layer.masksToBounds = true
        myProfile.layer.cornerRadius = myProfile.frame.width / 2
        

    
        // Do any additional setup after loading the view.
    }
    
    
         
            

}
