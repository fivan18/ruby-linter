class Parser
  def self.code(code_as_string)
    pp Ripper.parse(code_as_string)
  end
end