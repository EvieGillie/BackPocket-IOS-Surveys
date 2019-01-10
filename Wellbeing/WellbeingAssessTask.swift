//
//  WellbeingAssessTask.swift
//  Wellbeing
//
//  Created by Christopher Johnson on 12/15/18.
//  Copyright © 2018 Christopher Johnson. All rights reserved.
//

import Foundation
import ResearchKit

public var WellbeingTask: ORKOrderedTask {
    
    var steps = [ORKStep]()
    
    //Introduction to Well-being Assessment
    let instructionStep = ORKInstructionStep(identifier: "IntroStep")
    instructionStep.title = "Well-being Assessment"
    instructionStep.text = "This is a self-assessment that will give you feedback on 9 dimensions of your well-being."
    steps += [instructionStep]
    
    //Text Input Question
    let nameAnswerFormat = ORKTextAnswerFormat(maximumLength: 20)
    nameAnswerFormat.multipleLines = false
    let nameQuestionStepTitle = "What is your name?"
    let nameQuestionStep = ORKQuestionStep(identifier: "NameStep", title: nameQuestionStepTitle, answer: nameAnswerFormat)
    steps += [nameQuestionStep]
    
    //Image Input Question
    let moodQuestion = "How do you feel today?"
    let moodImages = [
        (UIImage(named: "HappyFace")!, "Happy"),
        (UIImage(named: "NeutralFace")!, "Just Okay"),
        (UIImage(named: "SadFace")!, "Sad"),
        ]
    let moodChoice : [ORKImageChoice] = moodImages.map {
        return ORKImageChoice(normalImage: $0.0, selectedImage: nil, text: $0.1, value: $0.1 as NSCoding & NSCopying & NSObjectProtocol)
    }
    let answerFormat: ORKImageChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormat(with: moodChoice)
    let moodQuestionStep = ORKQuestionStep(identifier: "MoodStep", title: moodQuestion, answer: answerFormat)
    steps += [moodQuestionStep]
    
    //Numeric Input Question
    let ageQuestion = "How old are you?"
    let ageAnswer = ORKNumericAnswerFormat.integerAnswerFormat(withUnit: "years")
    ageAnswer.minimum = 18
    ageAnswer.maximum = 85
    let ageQuestionStep = ORKQuestionStep(identifier: "AgeStep", title: ageQuestion, answer: ageAnswer)
    steps += [ageQuestionStep]
    
    //Summary
    let completionStep = ORKCompletionStep(identifier: "SummaryStep")
    completionStep.title = "Congratulations."
    completionStep.text = "You have completed the well-being assessment."
    steps += [completionStep]
    
    return ORKOrderedTask(identifier: "WellbeingTask", steps: steps)
}


