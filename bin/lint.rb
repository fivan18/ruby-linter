#!/usr/bin/env ruby
# frozen_string_literal: true

require 'tty-prompt'
require 'yaml'
require_relative '../lib/manager.rb'

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

SYMBOL_VALIDATIONS = [:validation1]

VALIDATIONS = {
  :validation1 => 'no-ascii identifiers'
}

path_file = Dir.pwd + '/' + ARGV[0]
manager = Manager.new(path_file)
yml = YAML.load(File.read(Dir.pwd + '/test_code.yml'))

display(:validation1, manager.with_no_conventions(:validation1))

pp yml

