#Start Script
#import the xcodeproj ruby gem
require "xcodeproj"
#define the path to your .xcodeproj file

project_path = ARGV[0]
project_name = ARGV[1]
bridging_header = ARGV[2]
puts project_path       #prints test1
puts project_name
puts bridging_header


#open the xcode project
project = Xcodeproj::Project.open(project_path)
group = project.main_group[project_name]

#get the file reference for the file to add
file = group.new_file(bridging_header)
#add the file reference to the projects first target
main_target = project.targets.first
main_target.add_file_references([file])

project.targets.each do |target|
  target.build_configurations.each do |config|
    config.build_settings['SWIFT_OBJC_BRIDGING_HEADER'] ||= project_name + "/" + bridging_header
    config.build_settings['CLANG_ENABLE_MODULES'] ||= 'YES'
    
  end
end

#finally, save the project
project.save
#End Script

