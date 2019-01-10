//
//  ConsentTask.swift
//  Wellbeing
//
//  Created by Christopher Johnson on 12/14/18.
//  Copyright © 2018 Christopher Johnson. All rights reserved.
//

import Foundation
import ResearchKit


public var ConsentTask: ORKOrderedTask {
    
    let Document = ORKConsentDocument()
    Document.title = "Wellbeing Consent"
    
    let sectionTypes: [ORKConsentSectionType] = [
        .overview,
        .dataGathering,
        .privacy,
        .dataUse,
        .timeCommitment,
        .studySurvey,
        .studyTasks,
        .withdrawing
    ]
    
    let consentSections: [ORKConsentSection] = sectionTypes.map { contentSectionType in
        let consentSection = ORKConsentSection(type: contentSectionType)
        consentSection.summary = "Complete the study"
        consentSection.content = "This survey will ask you three questions and you will also measure your tapping speed by performing a small activity."
        return consentSection
    }
    
    Document.sections = consentSections
    Document.addSignature(ORKConsentSignature(forPersonWithTitle: nil, dateFormatString: nil, identifier: "UserSignature"))
    
    var steps = [ORKStep]()
    
    //Visual Consent
    let visualConsentStep = ORKVisualConsentStep(identifier: "VisualConsent", document: Document)
    steps += [visualConsentStep]
    
    //Signature
    let signature = Document.signatures!.first! as ORKConsentSignature
    let reviewConsentStep = ORKConsentReviewStep(identifier: "Review", signature: signature, in: Document)
    reviewConsentStep.text = "Review the consent"
    reviewConsentStep.reasonForConsent = "Consent to join the Research Study."
    
    steps += [reviewConsentStep]
    
    //Completion
    let completionStep = ORKCompletionStep(identifier: "CompletionStep")
    completionStep.title = "Welcome"
    completionStep.text = "Thank you for using BackPocket"
    steps += [completionStep]
    
    return ORKOrderedTask(identifier: "ConsentTask", steps: steps)
}
