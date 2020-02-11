require 'ripper'

class Code 
  def initialize(path_file)
    @file_to_string = File.read(path_file)
    @symbolic_expression_tree = Ripper.sexp(@file_to_string)
  end

  def variables
    # [:assign, [:var_field, [:@ident, "заплата", [5, 2]]], [:@int, "1_000", [5, 19]]]
    assignations = []
    find(:assign, assignations)

    variables = []
    assignations.each do |assign|
      # [:var_field, [:@ident, "заплата", [5, 2]]]
      var_field = assign[1]

      variable = [var_field[1][1], var_field[1][2]]
      variables.push(variable)
    end
    variables
  end

  def symbols

  end

  def methods
  end

  def classes
  end

  private
  def find(sym, matched_arrays, array = @symbolic_expression_tree)
    if array[0] == sym
      matched_arrays.push(array)
      return matched_arrays
    end

    array.each do |item|
      if item.is_a?(Array)
        find(sym, matched_arrays, item)
      end
    end
  end
end