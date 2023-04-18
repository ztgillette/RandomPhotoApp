//
//  ViewController.swift
//  RandomPhoto
//
//  Created by Zach Gillette on 4/18/23.
//

import UIKit

class ViewController: UIViewController {
    
    //WAIT NO, idk what this is
    //example function that gets picture
    //function is private, let = 'def', imageView is name
    //and UIImageView is the variable type that will be returned
    private let imageView: UIImageView = {
        
        //UIImageView variable
        let imageView = UIImageView()
        //making aspect ratio stay the same for no stretching
        imageView.contentMode = .scaleAspectFill
        //background color of image is white (since there is no photo yet)
        imageView.backgroundColor = .white
        //returning image
        return imageView
    
        //presumably arguments would go in () below??
    }()
    
    private let button: UIButton = {
        
        //create button
        let button = UIButton()
        
        //set button background color
        button.backgroundColor = .white
        
        //set button text in its 'normal' state
        button.setTitle("Random Photo", for: .normal)
        //set button text color
        button.setTitleColor(.black, for: .normal)
        
        //return button
        return button
        
    }()
    
    let colors: [UIColor] = [
        .systemRed,
        .systemBlue,
        .systemGray
    ]
    
    let mylinks: [String] = [
        
        "https://www.thesprucepets.com/thmb/YBO6dLNaRUrr34ra0W4KGim00q4=/6411x0/filters:no_upscale():strip_icc()/puppies-three-to-six-months-4570930-hero-bf2f59d75dcb4294991d6bd8cd51ec7c.jpg",
        "https://vitapet.com/media/sz1czkya/benefits-of-getting-a-puppy-900x600.jpg?anchor=center&mode=crop&width=1240&rnd=132503927246630000",
        "https://upload.wikimedia.org/wikipedia/commons/6/6e/Golde33443.jpg"
    
    ]

    //the main function that swift gives us to start off with
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //change background color
        view.backgroundColor = .systemBlue
        
        //add in image
        view.addSubview(imageView)
        //adds at specific coordinates, wid, and hei
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        
        //centers the image on the screen
        imageView.center = view.center
        
        //adds button onto the screen
        view.addSubview(button)
        
        getRandomPhoto()
        
        //attaches button to its function
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        
    }
    
    
    //this function is whats called when the button is pressed
    // apparently @objc is necessary for attaching to an object (button)
    // on the screen
    @objc func didTapButton() {
        
        //the action the button will do
        getRandomPhoto()
        
        //change background color to green
        view.backgroundColor = colors.randomElement()
       
        
    }
    
    //creates the button by overriding some properties of the side of the screen
    //I dont really understand this fully, but it seems important
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        button.frame = CGRect(
            x: 20,
            y: view.frame.size.height-150-view.safeAreaInsets.bottom,
            width: view.frame.size.width-40,
            height: 55
        )
    }
    
    //this function gets a random photo from the internet
    func getRandomPhoto() {
        
        //string of url of website that gives random photo
        let urlString = mylinks.randomElement()!
        //converts string into actual url
        //! tells swift that url definitely works
        let url = URL(string: urlString)!
        
        //try to get photo data from link (pixels...?)
        guard let data = try? Data(contentsOf: url) else {
            return
        }
        
        //create image from data
        imageView.image = UIImage(data: data)
        
    }


}

