# Integrator

Command-line utility for integrating Contextu.al sdk

## Overview
Integrator is a Command-line utility for automating the integratation Contextu.al sdk into your apps. 

It performs the all the neccessary integration steps mention here https://dashboard.contextu.al/docs/sdks/ios/integration/ 

## System Requirements
* Xcode 13.x
* iOS 13
* Swift Package Manager


## Usage

    curl https://contextu.al/integrator
    integrator <APP_KEY> <PATH_TO_XCODE_PROJECT>


### Integrator Output
```
📦  Decoding the config file ...

🚀  Starting to integrate contexu.al sdk with the project : IntegratorSwift...

🌍  Cloning repo: https://github.com/contextu-al/integrator

☕  Adding cocoa pods\n

🔥  Adding Bridging Headers

📁  Replacing base classes

📬  Opening the project

✅  All done! 🎉  Good luck with your project! 🙌  


```              
## Community

Discord: https://discord.gg/hPayYaagV8
                               
TODO
- setup binary build using github actions
- Make a binary distribution
