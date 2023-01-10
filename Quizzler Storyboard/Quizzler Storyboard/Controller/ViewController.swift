//
//  ViewController.swift
//  Quizzler Storyboard
//
//  Created by Jeevan Chandra Joshi on 09/01/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var progressView: UIProgressView!
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var falseButton: UIButton!
    @IBOutlet var trueButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUi()
    }

    @IBAction func answerSelected(_ sender: UIButton) {
        if Quiz.checkAnswer(sender.currentTitle) {
            sender.backgroundColor = .green
        } else {
            sender.backgroundColor = .red
        }
        Quiz.nextQuestion()
        Timer.scheduledTimer(timeInterval: 0.25, target: self, selector: #selector(updateUi), userInfo: nil, repeats: false)
    }

    @objc func updateUi() {
        trueButton.backgroundColor = .clear
        falseButton.backgroundColor = .clear
        questionLabel.text = Quiz.getQuestion()
        progressView.progress = Quiz.getProgress()
    }
}
