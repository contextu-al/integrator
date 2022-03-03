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
  
           Pointzi.sharedInstance().registerInstall(forApp: "MY_APP_KEY", withDebugMode: true)
"""


func add_Intializer_In_AppDelegate(projectName : String , app_key:String) throws {
    let intializerString = replacemantString.replacingOccurrences(of: "MY_APP_KEY", with: app_key)
    try search_pattern(fileName: "AppDelegate.swift", pattern: searchExpression, replacemantString: intializerString)
}

func replace_bases_classes() {
    let _ = shell(command: "sed -i '' 's/UIViewController/StreetHawkBaseViewController/g' ViewController.swift")
}

func add_shCuid() {}
