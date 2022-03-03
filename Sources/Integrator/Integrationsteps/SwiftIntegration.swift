//
//  File.swift
//  
//
//  Created by Ganesh Faterpekar on 31/1/22.
//

import Foundation
import SwiftUI
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

func replace_bases_classes(projetName: String ,controllers : [String]) {
    controllers.forEach { controller in
     let command = "find \(projetName)  -type f -name \"\(controller).swift\" -print|xargs perl -i -pe \'s/UIViewController/PointziBaseViewController/g\'"
     let _ = shell(command: command)
    }
}

func add_shCuid() {}
