class Parser
  def self.code(code_as_string)
    Ripper.sexp(code_as_string)
  end

  def self.find(sym, array, matched_arrays)
    if array[0] == sym
      matched_arrays.push(array)
      return matched_arrays
    end

    array.each do |item|
      if item.is_a?(Array)
        find(sym, item, matched_arrays)
      end
    end
  end
end