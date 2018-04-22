//
//  PageViewController.swift
//  QuizO2
//
//  Created by Kordian Ledzion on 22/04/2018.
//  Copyright © 2018 KordianLedzion. All rights reserved.
//

import UIKit
import CHIPageControl

class PageViewController: UIPageViewController {
    
    private var quiz: Quiz
    private var vcs = [UIViewController]()
    private let questions: [Question]
    private let pg = UIPageViewController()
    private let pageControl = CHIPageControlJalapeno(frame: CGRect(x: 0, y:0, width: 100, height: 20))
    private unowned let viewModel: QuizViewModel
    private let backButton = UIButton()
    private let finishButton = UIButton()
    
    init(quiz: Quiz, viewModel: QuizViewModel) {
        self.viewModel = viewModel
        self.quiz = quiz
        self.questions = quiz.questions
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateViewControllers()
        delegate = self
        dataSource = self
        setUpPageControl()
        setUpBackButton()
        setUpFinishButton()
        setViewControllers([vcs[quiz.progress]], direction: .forward, animated: true, completion: nil)
        pageControl.progress = Double(quiz.progress)
    }
    
    private func setUpBackButton() {
        backButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backButton)
        
        backButton.setTitle("< Powrót", for: .normal)
        backButton.tintColor = UIColor.init(red: 0.35, green: 0.65, blue: 1.0, alpha: 1.0)
        backButton.setTitleColor(UIColor.init(red: 0.35, green: 0.65, blue: 1.0, alpha: 1.0), for: .normal)
        backButton.addTarget(nil, action: #selector(dismissVc), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5.0),
            backButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -5.0)
        ])
    }
    
    private func setUpFinishButton() {
        finishButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(finishButton)
        
        finishButton.setTitle("Zakończ!", for: .normal)
        finishButton.tintColor = UIColor.init(red: 0.35, green: 0.65, blue: 1.0, alpha: 1.0)
        finishButton.setTitleColor(UIColor.init(red: 0.35, green: 0.65, blue: 1.0, alpha: 1.0), for: .normal)
        finishButton.addTarget(nil, action: #selector(didFinishQuiz), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            finishButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5.0),
            finishButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -5.0)
            ])
    }
    
    private func setUpPageControl() {
        pageControl.numberOfPages = vcs.count
        pageControl.radius = 4
        pageControl.tintColor = UIColor.init(white: 0.7, alpha: 1.0)
        pageControl.currentPageTintColor = UIColor.init(red: 0.35, green: 0.65, blue: 1.0, alpha: 1.0)
        pageControl.padding = 6
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pageControl)
        NSLayoutConstraint.activate([
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -15.0)
        ])
    }
    
    private func populateViewControllers() {
        for index in 0..<questions.count {
            vcs.append(QuestionViewController(question: questions[index], delegate: self))
        }
    }

}

extension PageViewController: UIPageViewControllerDelegate {
    
}

extension PageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let index = vcs.index(of: viewController)! - 1
        
        guard index >= 0 else {
            return nil
        }
        pageControl.set(progress: index, animated: true)
        return vcs[index]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let index = vcs.index(of: viewController)! + 1
        
        guard index < vcs.count else {
            return nil
        }
        pageControl.set(progress: index, animated: true)
        return vcs[index]
    }
    
}

extension PageViewController: QuizHandlerDelegate {
    
    @objc func didFinishQuiz() {
        var result = 0
        for index in 0..<questions.count {
            let userAnswer = quiz.userAnswers[index]
            for j in 0..<questions[index].answers.count {
                if questions[index].answers[j].isCorrect {
                    if j+1 == userAnswer {
                        result = result + 1
                    }
                }
            }
        }
        quiz.result = Double(Double(result) / Double(quiz.questionsCount))
        quiz.progress = 0
        for index in 0..<quiz.userAnswers.count {
            quiz.userAnswers[index] = 0
        }
        viewModel.updateQuiz(quiz)
        quiz = Quiz(quiz)
        dismissVc()
    }
    
    func didAnswerQuestion(_ number: Int) {
        quiz.userAnswers[Int(pageControl.progress)] = number
        if quiz.userAnswers[Int(pageControl.progress)] != 0 {
            quiz.progress += 1
        }
        viewModel.updateQuiz(quiz)
        quiz = Quiz(quiz)
    }
    
    @objc func dismissVc() {
        dismiss(animated: true)
    }
    
}
