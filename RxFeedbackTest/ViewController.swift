//
//  ViewController.swift
//  RxFeedbackTest
//
//  Created by mefilt on 31.07.2018.
//  Copyright © 2018 mefilt. All rights reserved.
//

import RxCocoa
import RxFeedback
import RxSwift
import UIKit

enum Event {
    case none
    case readyView
}

class ViewController: UIViewController {
    @IBOutlet var test: UILabel!

    var disposeBag: DisposeBag = .init()

    override func viewDidLoad() {
        super.viewDidLoad()

        let megaEvent = rx.methodInvoked(#selector(UIViewController.viewWillAppear(_:))).map { _ in Event.readyView }
        megaEvent.subscribe { _ in
            print("WTF")
        }

        let bindings: ((Driver<Int>) -> Signal<Event>) = bind(self) { owner, state in

            return Bindings(subscriptions: [state
                                .map { NSAttributedString(string: "\($0)") }
                                .drive(owner.test.rx.attributedText)],
            events: [megaEvent])
        }

        Driver
            .system(initialState: 0,
                    reduce: { state, _ in
                        return state + 10 
                    },
                    feedback: bindings)
            .drive()
            .disposed(by: disposeBag)
    }
}
