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
    let AButton = UIButton()
    let BButton = UIButton()
    let CButton = UIButton()

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
        stackView.addArrangedSubview(AButton)
        stackView.addArrangedSubview(BButton)
        stackView.addArrangedSubview(CButton)

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

        AButton.setTitle("A", for: .normal)
        AButton.setTitleColor(.white, for: .normal)
        AButton.setBackgroundImage(UIImage(named: "Rectangle"), for: .normal)
        AButton.titleLabel?.font = .systemFont(ofSize: 25)
        AButton.layer.cornerRadius = 25
        AButton.addAction(answerSelected(AButton), for: .touchUpInside)

        BButton.setTitle("B", for: .normal)
        BButton.setTitleColor(.white, for: .normal)
        BButton.setBackgroundImage(UIImage(named: "Rectangle"), for: .normal)
        BButton.titleLabel?.font = .systemFont(ofSize: 25)
        BButton.layer.cornerRadius = 25
        BButton.addAction(answerSelected(BButton), for: .touchUpInside)

        CButton.setTitle("C", for: .normal)
        CButton.setTitleColor(.white, for: .normal)
        CButton.setBackgroundImage(UIImage(named: "Rectangle"), for: .normal)
        CButton.titleLabel?.font = .systemFont(ofSize: 25)
        CButton.layer.cornerRadius = 25
        CButton.addAction(answerSelected(CButton), for: .touchUpInside)
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

            AButton.heightAnchor.constraint(equalToConstant: 100),
            BButton.heightAnchor.constraint(equalToConstant: 100),
            CButton.heightAnchor.constraint(equalToConstant: 100),
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
