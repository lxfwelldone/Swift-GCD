//
//  ViewController.swift
//  DemoS_GCD
//
//  Created by lxf2013 on 2020/1/17.
//  Copyright © 2020 lxf. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        testGroup()

    }
    
    

    ///
    func testGroup() {
        let group = DispatchGroup()
        debugPrint(Thread.current)
        
        group.enter()
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            debugPrint(Thread.current)
            debugPrint("5秒后执行")
            group.leave()
        }
        
        group.enter()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            debugPrint(Thread.current)
            debugPrint("3秒后执行")
        }
        group.leave()
        
        group.notify(queue: .main) {
            debugPrint("都执行结束了")
        }
    }
}

