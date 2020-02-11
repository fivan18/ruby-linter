#!/usr/bin/env ruby
# frozen_string_literal: true

require 'tty-prompt'
require 'yaml'

require_relative '../lib/validator.rb'

def display(symbol, no_valid)
  prompt = TTY::Prompt.new

  if no_valid.empty?
    prompt.ok(VALIDATIONS[symbol] + '=========> No offences')
  else
    prompt.error(VALIDATIONS[symbol])
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
  :validation1 => 'no-ascii identifiers'
}


path_file = Dir.pwd + '/'

puts config(path_file)




