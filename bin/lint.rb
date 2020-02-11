#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative '../lib/manager.rb'

SYMBOL_VALIDATIONS = [:validation1]

VALIDATIONS = {
  :validation1 => 'no-ascii identifiers'
}

path_file = Dir.pwd + '/' + ARGV[0]
manager = Manager.new(path_file)

pp manager.with_no_conventions(:validation1)

