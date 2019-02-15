//
//  w6d5_ui_performance_testingUITests.swift
//  w6d5-ui-performance-testingUITests
//
//  Created by Spencer Symington on 2019-02-15.
//  Copyright © 2019 Roland. All rights reserved.
//

import XCTest

class w6d5_ui_performance_testingUITests: XCTestCase {
  var app :XCUIApplication!
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
      app = XCUIApplication()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
      
      addNewMeal(name: "burger", cals: 300)
    }
  func addNewMeal(name:String , cals:Int){
    
    app.navigationBars["Master"].buttons["Add"].tap()
    
    let addAMealAlert = app.alerts["Add a Meal"]
    let collectionViewsQuery = addAMealAlert.collectionViews
    let textField1 = collectionViewsQuery.children(matching: .other).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 1).children(matching: .textField).element
    textField1.tap()
    textField1.typeText(name)
    
    let textField2 = collectionViewsQuery.children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 1).children(matching: .textField).element
    textField2.tap()
    textField2.typeText("\(cals)")
    addAMealAlert.buttons["Ok"].tap()
  }
  
  func testDeleteMeal(){
    
    addNewMeal(name: "Burger", cals: 300)
    
    deleteMeal(name: "Burger", cals: 300)
    

  }
  func deleteMeal(name:String , cals:Int){
    let tablesQuery = app.tables
    
    let mealText = app.tables.staticTexts["\(name) - \(cals)"]
    if mealText.exists {
      mealText.swipeLeft()
      tablesQuery.buttons["Delete"].tap()
      
    }
  }
  func testShowMealDetails(){
    
    
    
    let app = XCUIApplication()
    app.tables/*@START_MENU_TOKEN@*/.staticTexts["pizza - 600"]/*[[".cells.staticTexts[\"pizza - 600\"]",".staticTexts[\"pizza - 600\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    
    let mealdetailsStaticText = app/*@START_MENU_TOKEN@*/.staticTexts["mealDetails"]/*[[".staticTexts[\"pizza - 600\"]",".staticTexts[\"mealDetails\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
    print("the label says \(mealdetailsStaticText.label)")
    XCTAssertEqual(mealdetailsStaticText.label, "pizza - 600")
    mealdetailsStaticText.tap()
    
    app.navigationBars["Detail"].buttons["Master"].tap()
   
  }
}
