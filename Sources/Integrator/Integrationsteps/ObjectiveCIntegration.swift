//
//  File.swift
//  
//
//  Created by Ganesh Faterpekar on 31/1/22.
//

import Foundation

let searchExpressionObjc = ".*didFinishLaunchingWithOptions.*\\s*\\n*\\{"
let replacemantStringObjc = """
   - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  
          [POINTZI registerInstallForApp:@"MY_APP_KEY" withDebugMode:YES];
"""


func add_Intializer_In_Obj_AppDelegate(config: ConfigDetails) throws {
    let intializerString = replacemantStringObjc.replacingOccurrences(of: "MY_APP_KEY", with: config.key)
    try search_pattern(fileName: "AppDelegate.m", pattern: searchExpressionObjc, replacemantString: intializerString)
}


func include_Streehawk_Header(projetName: String ,controller : String, extensionType: String) {
    let command = "find \(projetName)  -type f -name \"\(controller)\(extensionType)\" -exec sed -i '' '1s/^/#import \"StreetHawkCore_Pointzi.h\"/g' {} +"
    let _ = shell(command: command)
}
