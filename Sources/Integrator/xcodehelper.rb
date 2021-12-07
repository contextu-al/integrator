#import the xcodeproj ruby gem
require "xcodeproj"
#define the path to your .xcodeproj file

projectpath = ARGV[0]
projectname = ARGV[1]
bridgingheader = ARGV[2]
puts projectpath       #prints test1
puts projectname
puts bridgingheader


#project_path = "/Users/ganeshfaterpekar/Documents/SaiProjects/Development/Pointzi_SH/ios_sdk_packages/SampleiOSProject/StoryBoardSwiftProject/StoryBoardSwiftProject.xcodeproj"
#open the xcode project
project = Xcodeproj::Project.open(project_path)
group = project.main_group[projectname]

#get the file reference for the file to add
file = group.new_file(bridgingheader)
#add the file reference to the projects first target
main_target = project.targets.first
main_target.add_file_references([file])
#finally, save the project
project.save

