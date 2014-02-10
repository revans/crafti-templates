$stdout.sync = true

# standard libraries
require 'pathname'
require 'logger'

# setup bundler to load the env manager
require 'rubygems'
require 'bundler/setup'
require 'env_manager'

# application files
require './config/application'
require './config/configuration'