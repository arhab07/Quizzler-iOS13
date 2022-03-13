//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = Timer()
    
    @IBOutlet var score: UILabel!
    @IBOutlet var questionView: UILabel!
    
    @IBOutlet var progessBar: UIProgressView!
    
    @IBOutlet var trueButton: UIButton!
    
    @IBOutlet var falseButton: UIButton!
   
   var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        update()
   
    }

    
    @IBAction func answerButton(_ sender: UIButton) {
        timer.invalidate()
        let userAnswer = sender.currentTitle!
        
       let checkAns = quizBrain.checkAnswer(userAnswer)
            
            if   checkAns {
            sender.backgroundColor = UIColor.green
        }else{
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.getNextQuestion()
        
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(update), userInfo: nil, repeats: true)
 
        
    }
    
    
    
    
    @objc   func update(){
        questionView.text = quizBrain.getQuestionText()
        progessBar.progress = quizBrain.getProgess()
        score.text = "Score: \(quizBrain.getScore())"
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        
    }
    
    
    

}

