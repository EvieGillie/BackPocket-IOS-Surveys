//
//  ViewController.swift
//  Wellbeing
//
//  Created by Christopher Johnson on 12/14/18.
//  Copyright © 2018 Christopher Johnson. All rights reserved.
//

import UIKit
import ResearchKit

class ViewController: UIViewController, ORKTaskViewControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func consentClicked(_ sender: Any) {
        let taskViewController = ORKTaskViewController(task: ConsentTask, taskRun: nil)
        taskViewController.delegate = self
        present(taskViewController, animated: true, completion: nil)
    }
    
    @IBAction func wellbeingClicked(_ sender: Any) {
        let taskViewController = ORKTaskViewController(task: WellbeingTask, taskRun: nil)
        taskViewController.delegate = self
        present(taskViewController, animated: true, completion: nil)
    }
    
    @IBAction func barriersClicked(_ sender: Any) {
        let taskViewController = ORKTaskViewController(task: BarriersTask, taskRun: nil)
        taskViewController.delegate = self
        present(taskViewController, animated: true, completion: nil)
    }
    
    
    // MARK: - ORKTaskViewControllerDelegate Protocol
    
    func taskViewController(_ taskViewController: ORKTaskViewController, didFinishWith reason: ORKTaskViewControllerFinishReason, error: Error?) {

}
}
