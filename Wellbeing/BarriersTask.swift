//
//  BarriersTask.swift
//  Wellbeing
//
//  Created by Christopher Johnson on 12/16/18.
//  Copyright © 2018 Christopher Johnson. All rights reserved.
//
//  References
//  Schoolplanner. 2018. Top Ten Barriers to Student Success. Accessed on December 31, 2018: https://www.schoolplanner.com/2018/03/01/barriers-student-success/

//  Lake Research Partners. 2011. Exploring Student Attitudes, Aspirations & Barriers to Success. Washington, DC: Lake Research Partners.

//  Falcon, Lauren. June . Breaking Down Barriers: First-Generation College Students and College Success. Innovation Showcase, Vol. 10, No. 6. Accessed December 31, 2018: https://www.league.org/innovation-showcase/breaking-down-barriers-first-generation-college-students-and-college-success




import Foundation
import ResearchKit

public var BarriersTask: ORKTask {
    
    var steps = [ORKStep]()
    
    //Introduction to Barriers Assessment
    let instructionStep = ORKInstructionStep(identifier: "IntroStep")
    instructionStep.title = "What's getting between you and your success?"
    instructionStep.text = "Identify and rank barriers that you think may get in your way this year. On a scale of 1-10, 10 indicates the most challenging barrier you may face."
    steps += [instructionStep]
    
    //barrier choices with ranking scale
    
    let stepTitle = NSLocalizedString("What are your barriers to college success?", comment: "On a scale of 1-10, 10 is the highest, or most challenging, barrier. 1 indicates the lowest, or least challenging, barrier.")
    
    //This creates the scale
    let step1AnswerFormat = ORKAnswerFormat.scale(withMaximumValue: 10, minimumValue: 1, defaultValue: NSIntegerMax, step: 1, vertical: false, maximumValueDescription: "High barrier", minimumValueDescription: "Low barrier")
    
    //These are the barriers that the student will rank.
    
    // Advice and guidance
    let questionStep1 = ORKQuestionStep(identifier: "adviceStepID", title: "Academic advice or guidance.", text: "I am not confident that I can get help or advice to choose my classes, decide my major, or succeed academically.", answer: step1AnswerFormat)
    
    questionStep1.text = NSLocalizedString("Discrete Scale", comment: "")
    
    questionStep1.text = "I am not confident that I can get help or advice to choose my classes, decide my major, or succeed academically."
    
    steps += [questionStep1]
    
    // Costs and financial concerns

    let questionStep2 = ORKQuestionStep(identifier: "financeStepID", title: "Money", text: "I worry that I will not have enough money to stay in school.", answer: step1AnswerFormat)
    
    questionStep2.text = NSLocalizedString("Discrete Scale", comment: "")
    
    questionStep2.text = "I worry that I will not have enough money to stay in school."
    
    steps += [questionStep2]
    
    //time management
    
    let questionStep3 = ORKQuestionStep(identifier: "timeStepID", title: "Time Management", text: "I am not sure how I am going to balance my school work, my job, family, and other responsiblities.", answer: step1AnswerFormat)
    
    questionStep3.text = NSLocalizedString("Discrete Scale", comment: "")
    
    questionStep3.text = "I am not sure how I am going to balance my school work, my job, family, and other responsiblities."
    
    steps += [questionStep3]
    
    // organizational skills
    
    let questionStep4 = ORKQuestionStep(identifier: "organizationStepID", title: "Keeping Organized", text: "I struggle to organized and prioritize my tasks.", answer: step1AnswerFormat)
    
    questionStep4.text = NSLocalizedString("Discrete Scale", comment: "")
    
    questionStep4.text = "I struggle to organized and prioritize my tasks."
    
    steps += [questionStep4]
    
    //family or social support
    
    let questionStep5 = ORKQuestionStep(identifier: "socialStepID", title: "Social Support", text: "I have little or no support from family or friends.", answer: step1AnswerFormat)
    
    questionStep5.text = NSLocalizedString("Discrete Scale", comment: "")
    
    questionStep5.text = "I struggle to organized and prioritize my tasks."
    
    steps += [questionStep5]
    
    //motivation
    
    let questionStep6 = ORKQuestionStep(identifier: "motivationStepID", title: "Motivation", text: "I worry that it will be hard to motivate myself.", answer: step1AnswerFormat)
    
    questionStep6.text = NSLocalizedString("Discrete Scale", comment: "")
    
    questionStep6.text = "I worry that it will be hard to motivate myself."
    
    steps += [questionStep6]
    
    //Not ready, underdeveloped skills
    
    let questionStep7 = ORKQuestionStep(identifier: "skillsStepID", title: "Ready for College", text: "I don't think that I have the knowledge or skills to succeed in college.", answer: step1AnswerFormat)
    
    questionStep7.text = NSLocalizedString("Discrete Scale", comment: "")
    
    questionStep7.text = "I don't think that I have the knowledge or skills to succeed in college."
    
    steps += [questionStep7]
    
    //stress and anxiety
    
    let questionStep8 = ORKQuestionStep(identifier: "stressStepID", title: "Stress & Anxiety", text: "I worry that stress and anxiety will interfere with my studies.", answer: step1AnswerFormat)
    
    questionStep8.text = NSLocalizedString("Discrete Scale", comment: "")
    
    questionStep8.text = "I worry that stress and anxiety will interfere with my studies."
    
    steps += [questionStep8]
    
    let questionStep9 = ORKQuestionStep(identifier: "descriminationStepID", title: "Descrimination", text: "I worry that I will be descriminated against because of my race, ethnicity, gender, or sexual orientation.", answer: step1AnswerFormat)
    
    questionStep9.text = NSLocalizedString("Discrete Scale", comment: "")
    
    questionStep9.text = "I worry that I will be descriminated against because of my race, ethnicity, gender, or sexual orientation."
    
    steps += [questionStep9]
    
    let questionStep10 = ORKQuestionStep(identifier: "confidenceStepID", title: "Confident", text: "I am not confident that I have what it takes to succeed in college.", answer: step1AnswerFormat)
    
    questionStep10.text = NSLocalizedString("Discrete Scale", comment: "")
    
    questionStep10.text = "I am not confident that I have what it takes to succeed in college."
    
    steps += [questionStep10]
    
    
//Summary
    let completionStep = ORKCompletionStep(identifier: "SummaryStep")
    completionStep.title = "Congratulations."
    completionStep.text = "You have identified and ranked your potential barriers."
    steps += [completionStep]

    return ORKOrderedTask(identifier: "BarriersTask", steps: steps)
}
    
    func taskViewController(taskViewController: ORKTaskViewController,
                            didFinishWithReason reason: ORKTaskViewControllerFinishReason,
                            error: NSError?) {
        if reason == .saved {
            let restorationData = taskViewController.restorationData
            // Save
            
        let taskResult = taskViewController.result
            
        taskViewController.dismiss(animated: true, completion: nil)
    }
}

