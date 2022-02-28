//
//  File.swift
//  
//
//  Created by Ganesh Faterpekar on 31/1/22.
//

import Foundation
let searchPattern = """
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
"""
let searchExpression = ".*didFinishLaunchingWithOptions.*->\\sBool\\s*\\n*\\{"

let replacemantString = """
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
  
 Pointzi.sharedInstance().registerInstall(forApp: "Ganesh_test", withDebugMode: true)
"""


func add_Intializer_In_AppDelegate(projectName : String) throws {
    try search_pattern(fileName: "AppDelegate.swift", pattern: searchExpression, replacemantString: replacemantString)
}

func replace_bases_classes() {
    let _ = shell(command: "sed -i '' 's/UIViewController/StreetHawkBaseViewController/g' ViewController.swift")
}

func add_shCuid() {}
