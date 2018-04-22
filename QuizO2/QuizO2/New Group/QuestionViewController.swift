//
//  QuestionViewController.swift
//  QuizO2
//
//  Created by Kordian Ledzion on 22/04/2018.
//  Copyright © 2018 KordianLedzion. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController, QuizHandler {
    
    
    private unowned let question: Question
    private let answers: [Answer]
    private let questionLabel = UILabel()
    private var answerButtons = [UIButton]()
    private let questionImage = UIImageView()
    private let questionImageHeightConstraint: NSLayoutConstraint
    unowned var delegate: QuizHandlerDelegate
    
    init(question: Question, delegate: QuizHandlerDelegate) {
        self.delegate = delegate
        self.question = question
        self.answers = question.answers
        questionImageHeightConstraint = questionImage.heightAnchor.constraint(equalToConstant: 0.0)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        setUpQuestionLabel()
        setUpConstraints()
        setUpButtons()
        if let url = question.imageUrl {
            setUpQuestionImage(url)
        }
    }
    
    private func setUpQuestionImage(_ url: String) {
        if url.count > 10 {
            questionImageHeightConstraint.constant = view.frame.height / 4.0
            questionImage.clipsToBounds = true
            questionImage.layer.cornerRadius = 20.0
            
            view.layoutIfNeeded()
            
            questionImage.setUpImage(with: url)
        }
    }
    
    private func setUpQuestionLabel() {
        questionLabel.text = question.text
        questionLabel.numberOfLines = 4
        questionLabel.adjustsFontSizeToFitWidth = true
        questionLabel.textAlignment = .center
        questionLabel.textColor = UIColor.init(red: 0.35, green: 0.65, blue: 1.0, alpha: 1.0)
        
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(questionLabel)
    }
    
    private func setUpButtons() {
        for index in 0..<answers.count {
            let button = UIButton()
            answerButtons.append(button)
            let buttonHeight = view.frame.height / 9.0
            let buttonOffset = CGFloat(index) * buttonHeight + CGFloat(index + 1) * 10.0
            
            button.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(button)
            button.backgroundColor = UIColor.init(white: 0.9, alpha: 0.5)
            
            if let url = URL(string: answers[index].imageUrl!) {
                button.setUpImage(with: url)
            }
            
            button.clipsToBounds = false
            button.layer.cornerRadius = 20.0
            button.addTarget(self, action: #selector(tapped), for: .touchUpInside)
            
            button.titleLabel?.textAlignment = .center
            button.titleLabel?.adjustsFontSizeToFitWidth = true
            button.setTitleColor(UIColor.init(red: 0.35, green: 0.65, blue: 1.0, alpha: 1.0), for: .normal)
            button.setTitle(answers[index].text, for: .normal)
            
            NSLayoutConstraint.activate([
                button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10.0),
                button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10.0),
                button.heightAnchor.constraint(equalToConstant: buttonHeight),
                button.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: buttonOffset)
            ])
        }
    }
    
    @objc private func tapped(_ sender: UIButton) {
        let answerNumber = answerButtons.index(of: sender)! + 1
        delegate.didAnswerQuestion(answerNumber)
    }
    
    private func setUpConstraints() {
        
        questionImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(questionImage)
        
        NSLayoutConstraint.activate([
            questionImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10.0),
            questionImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10.0),
            questionImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 5.0),
            questionImageHeightConstraint,
            
            questionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20.0),
            questionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20.0),
            questionLabel.topAnchor.constraint(equalTo: questionImage.bottomAnchor, constant: 5.0),
            questionLabel.heightAnchor.constraint(equalToConstant: view.frame.height / 6.0)
        ])
    }

}
