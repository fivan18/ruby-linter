#!/usr/bin/env ruby
# frozen_string_literal: true

require 'tty-prompt'
require 'yaml'

require_relative '../lib/validator.rb'

def display(element, validation, no_valid)
  prompt = TTY::Prompt.new

  if no_valid.empty?
    prompt.ok("#{element} =========> No offences")
  else
    prompt.error("#{element}, #{VALIDATIONS[validation]}")
    no_valid.each do |item|
      prompt.warn("      #{item[0]} line #{item[1][0]} column #{item[1][1]}")
    end
  end
end

def config(path_file)
  config = CONFIG
  if File.exist?(path_file + 'config.yml')
    config = YAML.load(File.read(path_file + 'config.yml'))
  end
  config
end

CONFIG = { :variables => [:ascii, :snakecase], :methods => [:ascii, :snakecase] }
VALIDATIONS = {
  :ascii => 'no-ascii identifiers',
  :snakecase => 'no-snakecase identifiers'
}


path_file = Dir.pwd + '/'

display(:variables, :ascii, [['заплата', [5, 2]]])




