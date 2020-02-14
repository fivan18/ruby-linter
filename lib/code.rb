require 'ripper'

class Code
  attr_reader :symbolic_expression_tree

  def initialize(path_file)
    @file_to_string = File.read(path_file)
    @symbolic_expression_tree = Ripper.sexp(@file_to_string)
  end

  def variables
    return [] unless @symbolic_expression_tree

    identifiers(:assign)
  end

  def symbols
    return [] unless @symbolic_expression_tree

    identifiers(:symbol_literal)
  end

  def classes
    name_classes = []
    if @symbolic_expression_tree.nil?
      tokenized_code = Ripper.lex(@file_to_string)
      indexes = tokenized_code.each_index.select do |i|
        tokenized_code[i][1] == :on_kw && tokenized_code[i][2] == 'class'
      end

      name_classes = indexes.map do |i|
        [tokenized_code[i + 2][2], tokenized_code[i + 2][0]]
      end
    else
      name_classes = identifiers(:class)
    end
    name_classes
  end

  def methods
    return [] unless @symbolic_expression_tree

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
      find(sym, matched_arrays, item) if item.is_a?(Array)
    end
  end

  def identifiers(symbol)
    # [:symbol,
    #   [:field, [:@ident, "lala", [5, 2]]]
    array = []
    find(symbol, array)

    identifiers = []
    array.each do |item|
      # [:field, [:@ident, "lala", [5, 2]]]
      field = item[1]
      field = item[1][1] if item[1][0] == :aref_field

      identifier = [field[1][1], field[1][2]]
      identifiers.push(identifier)
    end
    identifiers
  end
end
