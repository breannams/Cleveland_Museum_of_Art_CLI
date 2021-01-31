require 'pry'
require "rake"
require 'awesome_print' 
require 'colorize'
require 'httparty'

require "Cleveland_Museum_of_Art_CLI/version"

require_relative './Cleveland_Museum_of_Art_CLI/api'
require_relative './Cleveland_Museum_of_Art_CLI/concerns/findable'
require_relative './Cleveland_Museum_of_Art_CLI/artwork'
require_relative './Cleveland_Museum_of_Art_CLI/cli'

