//
//  main.swift
//  VanHack Algorithm
//
//  Created by Kamal Maged on 2019-10-13.
//  Copyright © 2019 Kamal Maged. All rights reserved.
//

import Foundation

print("Hello, World!")
struct Queue{
    var items:[Int] = []
    mutating func enqueue(element: Int)
    {
        items.append(element)
    }
    mutating func dequeue() -> Int?
    {
        if items.isEmpty {
            return nil
        }
        else{
            let tempElement = items.first
            items.remove(at: 0)
            return tempElement
        }
    }
    
}
func getTimes(time: [Int], direction: [Int]) -> [Int] {
    // Write your code here
    let n = time.count
    var queue = [Queue](repeating: Queue(), count: 2)
    
    var passTime = [Int](repeating: 0, count: n)
    var t: Int = time[0]
    var passingFlag = -1

    for i in 0...(n - 1) {
        queue[direction[i]].enqueue(element: i)
        while t < time[i] {
            if !queue[1].items.isEmpty {
            
            passTime[i] = time[queue[1].items.first!]
            t += 1
            queue[1].dequeue()
            passingFlag = 1
            } else if !queue[0].items.isEmpty && passingFlag <= 0 {
                
                passTime[i] = time[queue[0].items.first!]
                t += 1
                queue[0].dequeue()
                passingFlag = 0
            } else {
                t = time[i]
                passingFlag = -1
            }
        }
    }
   return passTime

}
print(getTimes(time: [0,1,1,7], direction: [0,1,1,0]))


