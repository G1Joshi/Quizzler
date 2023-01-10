//
//  ViewController.swift
//  Quizzler Storyboard
//
//  Created by Jeevan Chandra Joshi on 09/01/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var progressView: UIProgressView!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var AButton: UIButton!
    @IBOutlet var BButton: UIButton!
    @IBOutlet var CButton: UIButton!

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
        let options = Quiz.getOptions()
        AButton.backgroundColor = .clear
        BButton.backgroundColor = .clear
        CButton.backgroundColor = .clear
        AButton.setTitle(options[0], for: .normal)
        BButton.setTitle(options[1], for: .normal)
        CButton.setTitle(options[2], for: .normal)
        questionLabel.text = Quiz.getQuestion()
        progressView.progress = Quiz.getProgress()
        scoreLabel.text = "Score: \(Quiz.getScore())"
    }
}
