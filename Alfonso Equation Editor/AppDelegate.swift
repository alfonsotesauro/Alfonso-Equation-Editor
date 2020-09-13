//
//  AppDelegate.swift
//  Alfonso Equation Editor
//
//  Created by Alfonso Maria Tesauro on 06/12/2019.
//  Copyright © 2019 Alfonso Maria Tesauro. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var scrollView: SKTZoomingScrollView!
    @IBOutlet weak var equationView: SinusView!
    @IBOutlet weak var window: NSWindow!
    
    @IBOutlet weak var mathLabel: MTMathUILabel!
    @IBOutlet weak var toolsSegmentedControl: NSSegmentedControl!
    
    @IBOutlet weak var sinusViewLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var sinusViewTrailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var sinusViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var sinusViewBottomConstraint: NSLayoutConstraint!
    
    @objc dynamic var distancesString: String = ""

    @objc dynamic var firstSliderDoubleValue: Double = 1
    @objc dynamic var secondSliderDoubleValue: Double = 30
    @objc dynamic var thirdSliderDoubleValue: Double = 10
    @objc dynamic var fourthSliderDoubleValue: Double = 1.0
    @objc dynamic var fifthSliderDoubleValue: Double = 1.0
    @objc dynamic var sixthSliderDoubleValue: Double = 0.0
    @objc dynamic var numberOfPixelsInUnit: Double = 80.0 {
        didSet {
           self.equationView.setNeedsDisplay(self.equationView.bounds)
        }
    }
    @objc dynamic var shouldUseSquareGrid: Bool = true
    @objc dynamic var shouldDrawGrid: Bool = true
    @objc dynamic var shouldDrawAxes: Bool = true
    @objc dynamic var shouldDrawBasicLetters: Bool = true
    @objc dynamic var shouldDrawParabola: Bool = true
    @objc dynamic var shouldDrawRetta: Bool = false
    @objc dynamic var shouldDrawAbsoluteValue: Bool = false
    @objc dynamic var shouldDrawSin: Bool = false
    @objc dynamic var shouldDrawCos: Bool = false
    @objc dynamic var shouldDrawTan: Bool = false
    @objc dynamic var shouldDrawNumbers: Bool = true
    @objc dynamic var shouldDrawPowerThree: Bool = false {
        didSet(newValue) {
           
                self.equationView.setNeedsDisplay(self.equationView.bounds)
            
        }
    }
    @objc dynamic var shouldDrawPowerOfFour: Bool = false {
        didSet(newValue) {
           
                self.equationView.setNeedsDisplay(self.equationView.bounds)
            
        }
    }
    
    @objc dynamic var shouldApplyGridSpacing: Bool = false {
        didSet(newValue) {
           
                self.equationView.setNeedsDisplay(self.equationView.bounds)
            
        }
    }
    @objc dynamic var shouldApplyParabolaDivisor: Bool = true {
        didSet(newValue) {
            
                self.equationView.setNeedsDisplay(self.equationView.bounds)
            
        }
    }

    @objc dynamic var numberOfSteps: Double = 170 {
        didSet(newValue) {
            self.equationView.steps = newValue
        }
    }

    var kvoToken: NSKeyValueObservation?
    
    
    func applicationWillFinishLaunching(_ notification: Notification) {
        
        if #available(OSX 10.13, *) {
            self.sinusViewLeadingConstraint.isActive = false
            self.sinusViewTrailingConstraint.isActive = false
            self.sinusViewTopConstraint.isActive = false
            self.sinusViewBottomConstraint.isActive = false
        } else {
            // Fallback on earlier versions
        }
    }
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        
        self.scrollView.bind(NSBindingName(rawValue: "factor"), to: self, withKeyPath: "fifthSliderDoubleValue", options: nil)
        self.mathLabel.latex = "y = x^2";
        self.mathLabel.textColor = .white
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "distancesChanged"), object: nil, queue: nil) { (note) in
            
            print("\(note.userInfo)")
            
        }
        
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    @IBAction func userDidSelectOneOfTheCheckBoxes(_ sender: NSButton) {
        
        self.equationView.setNeedsDisplay(self.equationView.bounds)
        
        
    }
    @IBAction func userDidSelectScrollButton(_ sender: NSButton) {
        
        self.scrollView.scrollToCenter()
        
    }
    @IBAction func userDidSelectOneOfTheSliders(_ sender: NSSlider) {
           
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(performSetNeedsDisplay), object: nil)
        
        
        self.perform(#selector(performSetNeedsDisplay), with: nil, afterDelay: 1.0)
           
           
    }
    
    
    @objc func performSetNeedsDisplay() {
        self.equationView.setNeedsDisplay(self.equationView.bounds)
    }
    @IBAction func userDidSelectOneOfTheSlidersAndActImmediately(_ sender: NSSlider) {
    
        self.equationView.setNeedsDisplay(self.equationView.bounds)
    
    }
    @IBAction func userDidSelectResetToDefaults(_ sender: NSButton) {
        
        self.firstSliderDoubleValue = 3.0
        self.secondSliderDoubleValue = 1000.0
        self.thirdSliderDoubleValue = 10000.0
        self.fourthSliderDoubleValue = 1.0
        self.fifthSliderDoubleValue = 1.0
        self.sixthSliderDoubleValue = 0.0
        self.numberOfSteps = 167.324494949495
        DispatchQueue.main.async {
            self.equationView.setNeedsDisplay(self.equationView.bounds)
        }
    }
    
    
    @IBAction func userDidSelectSquareGridCheckbox(_ sender: NSButton) {
          
          self.equationView.setNeedsDisplay(self.equationView.bounds)
          
          
      }
//    // MARK: - Core Data stack
//
//    lazy var persistentContainer: NSPersistentContainer = {
//        /*
//         The persistent container for the application. This implementation
//         creates and returns a container, having loaded the store for the
//         application to it. This property is optional since there are legitimate
//         error conditions that could cause the creation of the store to fail.
//        */
//        let container = NSPersistentContainer(name: "Alfonso_Equation_Editor")
//        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
//            if let error = error {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//
//                /*
//                 Typical reasons for an error here include:
//                 * The parent directory does not exist, cannot be created, or disallows writing.
//                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
//                 * The device is out of space.
//                 * The store could not be migrated to the current model version.
//                 Check the error message to determine what the actual problem was.
//                 */
//                fatalError("Unresolved error \(error)")
//            }
//        })
//        return container
//    }()
//
//    // MARK: - Core Data Saving and Undo support
//
//    @IBAction func saveAction(_ sender: AnyObject?) {
//        // Performs the save action for the application, which is to send the save: message to the application's managed object context. Any encountered errors are presented to the user.
//        let context = persistentContainer.viewContext
//
//        if !context.commitEditing() {
//            NSLog("\(NSStringFromClass(type(of: self))) unable to commit editing before saving")
//        }
//        if context.hasChanges {
//            do {
//                try context.save()
//            } catch {
//                // Customize this code block to include application-specific recovery steps.
//                let nserror = error as NSError
//                NSApplication.shared.presentError(nserror)
//            }
//        }
//    }
//
//    func windowWillReturnUndoManager(window: NSWindow) -> UndoManager? {
//        // Returns the NSUndoManager for the application. In this case, the manager returned is that of the managed object context for the application.
//        return persistentContainer.viewContext.undoManager
//    }
//
//    func applicationShouldTerminate(_ sender: NSApplication) -> NSApplication.TerminateReply {
//        // Save changes in the application's managed object context before the application terminates.
//        let context = persistentContainer.viewContext
//
//        if !context.commitEditing() {
//            NSLog("\(NSStringFromClass(type(of: self))) unable to commit editing to terminate")
//            return .terminateCancel
//        }
//
//        if !context.hasChanges {
//            return .terminateNow
//        }
//
//        do {
//            try context.save()
//        } catch {
//            let nserror = error as NSError
//
//            // Customize this code block to include application-specific recovery steps.
//            let result = sender.presentError(nserror)
//            if (result) {
//                return .terminateCancel
//            }
//
//            let question = NSLocalizedString("Could not save changes while quitting. Quit anyway?", comment: "Quit without saves error question message")
//            let info = NSLocalizedString("Quitting now will lose any changes you have made since the last successful save", comment: "Quit without saves error question info");
//            let quitButton = NSLocalizedString("Quit anyway", comment: "Quit anyway button title")
//            let cancelButton = NSLocalizedString("Cancel", comment: "Cancel button title")
//            let alert = NSAlert()
//            alert.messageText = question
//            alert.informativeText = info
//            alert.addButton(withTitle: quitButton)
//            alert.addButton(withTitle: cancelButton)
//
//            let answer = alert.runModal()
//            if answer == .alertSecondButtonReturn {
//                return .terminateCancel
//            }
//        }
//        // If we got here, it is time to quit.
//        return .terminateNow
//    }
//
}

extension NSScrollView {
    func scrollToCenter() {
        guard let docView = documentView else { return }
        let center = CGPoint(
            x: docView.bounds.midX - contentView.frame.width / 2,
            y: docView.bounds.midY - (docView.isFlipped ? -1 : 1) * contentView.frame.height / 2
        )
        docView.scroll(center)
    }
}
