//
//  RatingControl.swift
//  CustomRatingControlExample
//
//  Created by mtpl on 20/12/17.
//  Copyright © 2017 mtplmoweb pvt ltd. All rights reserved.
//

import UIKit


protocol RatingControllerDelegate : class {
    func didSelected(rating : Int)
}

@IBDesignable class RatingControl: UIStackView
{
    var delegate : RatingControllerDelegate?
    
    @IBInspectable var starSize: CGSize = CGSize(width: 44.0, height: 44.0) {
        didSet {
            setupButtons()
        }
    }
    
    @IBInspectable var starCount: Int = 5 {
        didSet {
            setupButtons()
        }
    }
    @IBInspectable var fillStarImage : UIImage = UIImage.init(imageLiteralResourceName: "filledStar"){
        didSet{
            setupButtons()
        }
    }
    @IBInspectable var emptyStarImage : UIImage = UIImage.init(imageLiteralResourceName: "emptyStar"){
        didSet{
            setupButtons()
        }
    }

    private var ratingButtons = [UIButton]()
    var rating = 0 {
        didSet {
            updateButtonSelectionStates()
        }
    }
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        setupButtons()
    }    
    required init(coder: NSCoder)
    {
        super.init(coder: coder)
        setupButtons()
    }
    
    //MARK: Private Method
    private func setupButtons() {
        
        
        // Load Button Images
        let bundle = Bundle(for: type(of: self))
        //_ = fillStarImage
        //_ = emptyStarImage
        //_ = UIImage(named:"highlightedStar", in: bundle, compatibleWith: self.traitCollection)
        
        // clear any existing buttons
        for button in ratingButtons
        {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        ratingButtons.removeAll()
        
        
        for index in 0..<starCount
        {
            // Create the button
            let button = UIButton()
            
            
            
            // Set the button images
            button.setImage(emptyStarImage, for: .normal)
            button.setImage(fillStarImage, for: .selected)
            //button.setImage(#imageLiteral(resourceName: "highlightedStar"), for: .highlighted)
            //button.setImage(#imageLiteral(resourceName: "highlightedStar"), for: [.highlighted, .selected])
            
            // Add constraints
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
            
            
            // Set the accessibility label
            button.accessibilityLabel = "Set \(index + 1) star rating"
            
            
            // Setup the button action
            button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)
            
            // Add the button to the stack
            addArrangedSubview(button)
            
            // Add the new button to the rating button array
            ratingButtons.append(button)
        }
    }
    
    //MARK: Button Action
    @objc func ratingButtonTapped(button: UIButton)
    {
        guard let index = ratingButtons.index(of: button) else {
            fatalError("The button, \(button), is not in the ratingButtons array: \(ratingButtons)")
        }
        
        // Calculate the rating of the selected button
        let selectedRating = index + 1
        
        if selectedRating == rating {
            // If the selected star represents the current rating, reset the rating to 0.
            rating = 0
        } else {
            // Otherwise set the rating to the selected star
            rating = selectedRating
        }
        delegate?.didSelected(rating: rating)
    }
    private func updateButtonSelectionStates() {
        for (index, button) in ratingButtons.enumerated() {
            // If the index of a button is less than the rating, that button should be selected.
            button.isSelected = index < rating
            
         
            // Set the hint string for the currently selected star
            let hintString: String?
            if rating == index + 1 {
                hintString = "Tap to reset the rating to zero."
            } else {
                hintString = nil
            }
            
            // Calculate the value string
            let valueString: String
            switch (rating) {
            case 0:
                valueString = "No rating set."
            case 1:
                valueString = "1 star set."
            default:
                valueString = "\(rating) stars set."
            }
            
            // Assign the hint string and value string
            button.accessibilityHint = hintString
            button.accessibilityValue = valueString
        }
    }
}
    
    

