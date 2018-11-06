//
//  QueueViewController.swift
//  BASIC
//
//  Created by Je Min Son on 2018. 11. 5..
//  Copyright © 2018년 Je Min Son. All rights reserved.
//

import UIKit

class QueueViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //1. simpleQueuesWithSync() -> Main queue won't run until the queue's task has finished
        //2. simpleQueuesWithAsync() -> Dispatch queue and main queue run in parallel
        //3. queueWithQoS() -> tasks are evenly executed
        //4. queueWithQoSDifferntPriority() -> userInitiated has higher priority than utility
        //                  main queue > userInitiated > utility > background
        concurrentQueues()
    }
    
    func simpleQueuesWithSync() {
        let queue = DispatchQueue(label: "com.jemin.myqueue")
        
        queue.sync {               // Executed on the Background
            for i in 0..<10 {
                print("🔴", i)
            }
        }
        
        for i in 100..<110 {        // Executed on the Main Queue
            print("🔵", i)
        }
    }
    
    func simpleQueuesWithAsync() {
        let queue = DispatchQueue(label: "com.jemin.myqueue")
        
        queue.async {               // Executed on the Background
            for i in 0..<10 {
                print("🔴", i)
            }
        }
        
        for i in 100..<110 {        // Executed on the Main Queue
            print("🔵", i)
        }
    }
    
    
    /* Quality Of Service (Qos) */
    func queueWithQoS() {
        let queue1 = DispatchQueue(label: "com.jemin.myqueue1", qos: DispatchQoS.userInitiated)
        let queue2 = DispatchQueue(label: "com.jemin.myqueue2", qos: DispatchQoS.userInitiated)
        
        queue1.async {               // Executed on the Background
            for i in 0..<10 {
                print("🔴", i)
            }
        }
        
        queue2.async {
            for i in 100..<110 {        // Executed on the Main Queue
                print("🔵", i)
            }
        }
    }
    
    func queueWithQoSDifferntPriority() {
        let queue1 = DispatchQueue(label: "com.jemin.myqueue1", qos: DispatchQoS.userInitiated)
        let queue2 = DispatchQueue(label: "com.jemin.myqueue2", qos: DispatchQoS.utility)
        
        queue1.async {               // Executed on the Background
            for i in 0..<10 {
                print("🔴", i)
            }
        }
        
        queue2.async {
            for i in 100..<110 {        // Executed on the Main Queue
                print("🔵", i)
            }
        }
    }
    
    
    
    
    /* Concurrent Queues */
    func concurrentQueues() {
        let conQueue = DispatchQueue(label: "com.jemin.conQueue", qos: .utility, attributes: .concurrent)
    
        conQueue.async {               // Executed on the Background
            for i in 0..<10 {
                print("🔴", i)
            }
        }
        
        conQueue.async {
            for i in 100..<110 {        // Executed on the Main Queue
                print("🔵", i)
            }
        }
        
        conQueue.async {
            for i in 1000..<1010 {        // Executed on the Main Queue
                print("⚫️", i)
            }
        }
    }
    
    

}
