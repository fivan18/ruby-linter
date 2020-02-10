class Code
  attr_reader :file_to_string, :symbolic_expression_tree
  def initialize(path)
    @file_to_string = File.read(path)
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
end