//
//  PageViewController.swift
//  QuizO2
//
//  Created by Kordian Ledzion on 22/04/2018.
//  Copyright © 2018 KordianLedzion. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController {
    
    private let pg = UIPageViewController()
    private unowned var quiz: Quiz
    private let questions: [Question]
    private var vcs = [UIViewController]()
    
    init(quiz: Quiz) {
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
        setViewControllers([vcs[quiz.progress]], direction: .forward, animated: true, completion: nil)
    }
    
    private func populateViewControllers() {
        for _ in questions {
            vcs.append(QuestionViewController())
        }
    }

}

extension PageViewController: UIPageViewControllerDelegate {
    
}

extension PageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let index = vcs.index(of: viewController)!
        
        guard vcs.index(of: viewController)! > 0 else {
            return nil
        }
        
        return vcs[index - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let index = vcs.index(of: viewController)!
        
        guard vcs.index(of: viewController)! < vcs.count - 1 else {
            return nil
        }
        
        return vcs[index + 1]
    }
    
}
