//
//  ViewController.swift
//  Quizzler Programmatic
//
//  Created by Jeevan Chandra Joshi on 09/01/23.
//

import UIKit

class ViewController: UIViewController {
    let backgroundImage = UIImageView()
    let stackView = UIStackView()
    let progressView = UIProgressView()
    let scoreLabel = UILabel()
    let questionLabel = UILabel()
    let trueButton = UIButton()
    let falseButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "Primary")
        setupUi()
        setupConstraint()
        updateUi()
    }

    func setupUi() {
        view.addSubview(backgroundImage)
        view.addSubview(stackView)

        backgroundImage.image = UIImage(named: "Background")

        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        stackView.spacing = 10
        stackView.addArrangedSubview(progressView)
        stackView.addArrangedSubview(scoreLabel)
        stackView.addArrangedSubview(questionLabel)
        stackView.addArrangedSubview(trueButton)
        stackView.addArrangedSubview(falseButton)

        progressView.progressViewStyle = .bar
        progressView.progress = 0.5
        progressView.progressTintColor = UIColor(named: "Secondary")
        progressView.trackTintColor = .white

        scoreLabel.text = "Score: 0"
        scoreLabel.textColor = .white
        scoreLabel.textAlignment = .center

        questionLabel.text = "Question"
        questionLabel.textColor = .white
        questionLabel.font = .boldSystemFont(ofSize: 30)
        questionLabel.textAlignment = .center
        questionLabel.numberOfLines = 0

        trueButton.setTitle("True", for: .normal)
        trueButton.setTitleColor(.white, for: .normal)
        trueButton.setBackgroundImage(UIImage(named: "Rectangle"), for: .normal)
        trueButton.titleLabel?.font = .systemFont(ofSize: 25)
        trueButton.layer.cornerRadius = 25
        trueButton.addAction(answerSelected(trueButton), for: .touchUpInside)

        falseButton.setTitle("False", for: .normal)
        falseButton.setTitleColor(.white, for: .normal)
        falseButton.setBackgroundImage(UIImage(named: "Rectangle"), for: .normal)
        falseButton.titleLabel?.font = .systemFont(ofSize: 25)
        falseButton.layer.cornerRadius = 25
        falseButton.addAction(answerSelected(falseButton), for: .touchUpInside)
    }

    func setupConstraint() {
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            backgroundImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),

            progressView.heightAnchor.constraint(equalToConstant: 10),

            scoreLabel.heightAnchor.constraint(equalToConstant: 20),

            trueButton.heightAnchor.constraint(equalToConstant: 100),

            falseButton.heightAnchor.constraint(equalToConstant: 100),
        ])
    }

    func answerSelected(_ sender: UIButton) -> UIAction {
        return UIAction { _ in
            if Quiz.checkAnswer(sender.currentTitle) {
                sender.backgroundColor = .green
            } else {
                sender.backgroundColor = .red
            }
            Quiz.nextQuestion()
            Timer.scheduledTimer(timeInterval: 0.25, target: self, selector: #selector(self.updateUi), userInfo: nil, repeats: false)
        }
    }

    @objc func updateUi() {
        trueButton.backgroundColor = .clear
        falseButton.backgroundColor = .clear
        questionLabel.text = Quiz.getQuestion()
        progressView.progress = Quiz.getProgress()
        scoreLabel.text = "Score: \(Quiz.getScore())"
    }
}
