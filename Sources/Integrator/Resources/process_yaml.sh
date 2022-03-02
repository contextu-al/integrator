#!/bin/sh

# include parse_yaml function
. parse_yaml.sh

# read yaml file
eval $(parse_yaml $1 "config_")

# access yaml content
echo $config_integrator_projectname
echo $config_integrator_projectpath
echo $config_integrator_giturl
echo $config_integrator_appkey
echo $config_integrator_controllers
