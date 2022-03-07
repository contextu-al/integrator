//
//  File.swift
//  
//
//  Created by Ganesh Faterpekar on 31/1/22.
//

import Foundation
import SwiftUI

let searchExpressionSwift = ".*didFinishLaunchingWithOptions.*->\\sBool\\s*\\n*\\{"
let replacemantStringSwift = """
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
  
           Pointzi.sharedInstance().registerInstall(forApp: "MY_APP_KEY", withDebugMode: true)
"""

func add_Intializer_In_Swift_AppDelegate(config: ConfigDetails) throws {
    let intializerString = replacemantStringSwift.replacingOccurrences(of: "MY_APP_KEY", with: config.key)
    try search_pattern(fileName: "AppDelegate.swift", pattern: searchExpressionSwift, replacemantString: intializerString)
}


func replace_bases_classes(projetName: String ,controllers : [String], type : ProjectType) {
    let extensionType = getExtensionType(type: type)
    controllers.forEach { controller in
     let command = "find \(projetName)  -type f -name \"\(controller)\(extensionType)\" -print|xargs perl -i -pe \'s/UIViewController/PointziBaseViewController/g\'"
     let _ = shell(command: command)
        switch type {
        case .ObjC:
            include_Streehawk_Header(projetName: projetName, controller: controller, extensionType: extensionType)
        default :
            break
        }
    }
}



func getExtensionType(type : ProjectType) -> String {
    
    switch type {
    case .ObjC:
        return ".h"
    case .Swift:
        return ".swift"
    case .SwiftUI:
        return ""
    case .unknown:
        return ""
    }
}


func add_shCuid() {}
