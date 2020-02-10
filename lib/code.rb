require 'ripper'

class Code
  attr_reader :file_to_string, :symbolic_expression_tree
  
  def initialize(file)
    puts Dir.pwd
    @file_to_string = File.read(Dir.pwd + '/spec/test_code/' + file)
    @symbolic_expression_tree = Ripper.sexp(@file_to_string)
  end

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

  def bad_identifiers
    # [:assign, [:var_field, [:@ident, "заплата", [5, 2]]], [:@int, "1_000", [5, 19]]]
    assignations = []
    find(:assign, assignations)

    bad_identifiers_arr = []
    assignations.each do |assign|
      # [:var_field, [:@ident, "заплата", [5, 2]]]
      var_field = assign[1]

      unless var_field[1][1].ascii_only?
        bad = [var_field[1][1], var_field[1][2]]
        bad_identifiers_arr.push(bad)
      end
    end
    bad_identifiers_arr
  end
end