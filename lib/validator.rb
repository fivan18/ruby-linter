require_relative 'code.rb'

class Validator
  def initialize(path_file)
    @code = Code.new(path_file)
  end

  def validate(element, validation)
    elements = @code.send(element)

    send(validation, elements)
  end

  protected

  def ascii(elements)
    elements.reject { |element| element[0].ascii_only? }
  end

  def snakecase(elements)
    elements.reject do |element|
      element[0] == to_snakecase(element[0]) || element[0] == to_snakecase(element[0]).upcase
    end
  end

  def camelcase(elements)
    elements.reject { |element| element[0] == to_camelcase(to_snakecase(element[0])) }
  end

  private

  def to_snakecase(string)
    string.gsub(/::/, '/')
      .gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2')
      .gsub(/([a-z\d])([A-Z])/, '\1_\2')
      .tr('-', '_')
      .downcase
  end

  def to_camelcase(string)
    string.split('_').collect(&:capitalize).join
  end
end
