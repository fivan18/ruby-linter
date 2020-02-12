require 'ripper'

class Code 
  def initialize(path_file)
    @file_to_string = File.read(path_file)
    @symbolic_expression_tree = Ripper.sexp(@file_to_string)
  end

  def variables
    # [:assign, 
    #   [:var_field, [:@ident, "заплата", [5, 2]]], [:@int, "1_000", [5, 19]]]
    identifiers(:assign)
  end

  def symbols
    # [:symbol_literal, 
    #   [:symbol, [:@ident, "assign", [12, 10]]]]
    identifiers(:symbol_literal)
  end

  def classes
    # [:class,
    #   [:const_ref, [:@const, "TestScript", [3, 6]]]
    identifiers(:class)
  end

  def methods
    # [:def,
    #   [:@ident, "symbols", [25, 6]
    definitions = []
    find(:def, definitions)

    methods = []
    definitions.each do |definition|
      method = [definition[1][1], definition[1][2]]
      methods.push(method)
    end
    methods
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
  
  def identifiers(symbol)
    # [:symbol, 
    #   [:field, [:@ident, "заплата", [5, 2]]]
    array = []
    find(symbol, array)

    identifiers = []
    array.each do |item|
      if item[1][0] == :aref_field
        field = item[1][1]
      else
        # [:field, [:@ident, "заплата", [5, 2]]]
        field = item[1]
      end

      identifier = [field[1][1], field[1][2]]
      identifiers.push(identifier)
    end
    identifiers
  end
end