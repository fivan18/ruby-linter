#!/usr/bin/env ruby
# frozen_string_literal: true

require 'tty-prompt'
require 'yaml'

require_relative '../lib/validator.rb'

def display(validation, no_valid)
  prompt = TTY::Prompt.new

  if no_valid.empty?
    prompt.ok("      #{VALIDATIONS[validation]} =========> No offences")
  else
    prompt.error("      #{VALIDATIONS[validation]}")
    no_valid.each do |item|
      prompt.warn("         #{item[0]} line #{item[1][0]} column #{item[1][1]}")
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

CONFIG = {
  :classes => [:ascii, :camelcase],
  :variables => [:ascii, :snakecase],
  :methods => [:ascii, :snakecase],
  :symbols => [:ascii, :snakecase]
}
VALIDATIONS = {
  :ascii => 'non ascii identifiers',
  :snakecase => 'non snakecase identifiers',
  :camelcase => 'non camelcase identifiers'
}

path_file = Dir.pwd + '/'
prompt = TTY::Prompt.new
if !ARGV.empty? && File.exist?(path_file + ARGV[0])
  validator = Validator.new(path_file + ARGV[0])
  to_validate = config(path_file)

  to_validate.each do |element, validations|
    prompt.say(element.to_s)
    validations.each do |validation|
      no_valid = validator.validate(element, validation)
      display(validation, no_valid)
    end
  end
else
  prompt.error('The file doesn\'t exist')
end
