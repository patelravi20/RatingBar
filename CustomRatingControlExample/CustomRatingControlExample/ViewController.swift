//
//  ViewController.swift
//  CustomRatingControlExample
//
//  Created by mtpl on 20/12/17.
//  Copyright © 2017 mtplmoweb pvt ltd. All rights reserved.
//

import UIKit

class ViewController: UIViewController,RatingControllerDelegate{
    func didSelected(rating: Int) {
        self.lblRatingInfo.isHidden = false
        switch rating {
        case 0:
            self.lblRatingInfo.text = ""
            break
        case 1:
            self.lblRatingInfo.text = "worst"
            break
        case 2:
            self.lblRatingInfo.text = "bad"
            break
        case 3:
            self.lblRatingInfo.text = "OK"
            break
        case 4:
            self.lblRatingInfo.text = "better"
            break
        case 5:
            self.lblRatingInfo.text = "best"
            break
        default:
            break
        }
        
        
    }
    
   
    @IBOutlet weak var btnPhotoSelect: UIButton!
    @IBOutlet weak var ratingStackView: RatingControl!
    @IBOutlet weak var lblRatingInfo: UILabel!
    
    let picker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
         self.lblRatingInfo.isHidden = true
        picker.delegate = self
        ratingStackView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func btnPhotoSelectAction(_ sender: Any) {
        picker.allowsEditing = false
        picker.sourceType = .photoLibrary
        picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        present(picker, animated: true, completion: nil)
    }
    


}
extension ViewController : UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    //MARK: - Delegates
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage //2
        //btnPhotoSelect.contentMode = .scaleAspectFit //3
        btnPhotoSelect.setImage(chosenImage, for:.normal)
        dismiss(animated:true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
