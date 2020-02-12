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
    # [:symbol_literal, [:symbol, [:@ident, "assign", [12, 10]]]]
    symbols_literal = []
    find(:symbol_literal, symbols_literal)

    symbols = []
    symbols_literal.each do |literal|
      # [:symbol, [:@ident, "assign", [12, 10]]]
      symbol = literal[1]

      symbol_to_push = [symbol[1][1], symbol[1][2]]
      symbols.push(symbol_to_push)
    end
    symbols
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

  def classes
    # [:class,
    #   [:const_ref, [:@const, "TestScript", [3, 6]]]
    classes = []
    find(:class, classes)

    classes_to_return = []
    classes.each do |class1|
      # [:const_ref, [:@const, "TestScript", [3, 6]]]
      const_ref = class1[1]

      class_to_push = [const_ref[1][1], const_ref[1][2]]
      classes_to_return.push(class_to_push)
    end
    classes_to_return
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