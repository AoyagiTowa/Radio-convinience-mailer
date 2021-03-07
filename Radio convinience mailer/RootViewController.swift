//
//  RootViewController.swift
//  Radio convinience mailer
//
//  Created by Towa Aoyagi on 2021/03/07.
//

import UIKit

final class RootViewController: UIViewController {
    private var current: UIViewController?
    var window: UIWindow?

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        addChildViewController()
    }

    func transition(to vc: UIViewController) {

        addChild(vc)
        vc.view.frame = view.bounds
        view.addSubview(vc.view)
        vc.didMove(toParent: self)
        current?.willMove(toParent: nil)
        current?.view.removeFromSuperview()
        current?.removeFromParent()
        current = vc
    }

    private func addChildViewController() {
        // ViewControllerをRootVCの子VCとして追加
        guard let current = current else {
            return
        }

        addChild(current)
        current.view.frame = view.bounds
        view.addSubview(current.view)
        current.didMove(toParent: self)
    }

    func transitionToHome() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let mainView = storyBoard.instantiateViewController(identifier: "navigate")
        window?.rootViewController = mainView
        window?.makeKeyAndVisible()
    }

    func transitionToEntrance() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let mainView = storyBoard.instantiateViewController(identifier: "userRegister")
        window?.rootViewController = mainView
        window?.makeKeyAndVisible()
    }

   
}
