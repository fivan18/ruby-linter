require_relative 'code.rb'

class Validator
  attr_reader :code

  def initialize(path_file)
    @code = Code.new(path_file)
  end

  def validate(element, validation)
    elements = @code.send(element)

    self.send(validation, elements)
  end

  protected
  def ascii(elements)
    elements.select { |element| !element[0].ascii_only? }
  end

  private
  def to_snakecase(string)
    string.gsub(/::/, '/').
    gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
    gsub(/([a-z\d])([A-Z])/,'\1_\2').
    tr("-", "_").
    downcase
  end
end