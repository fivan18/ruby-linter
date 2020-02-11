require_relative 'code.rb'

class Manager
  attr_reader :code

  MAP_TO_METHODS = {
    :validation1 => :bad_identifiers
  }.freeze

  def initialize(path_file)
    @code = Code.new(path_file)
  end

  def with_no_conventions(sym)
    @code.send(MAP_TO_METHODS[sym])
  end
end