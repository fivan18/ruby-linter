# frozen_string_literal: true

class TestScript
  # bad - identifier using non-ascii characters
  заплата = 1_000
  
  # good
  salary = 1_000


  :SomeSymbol
  :someSymbol

  def a_Method
    nil
  end

  def anotherMethod
  end
end