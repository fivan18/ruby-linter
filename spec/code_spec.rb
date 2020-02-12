RSpec.describe Code do
  let(:code) { Code.new(Dir.pwd + '/spec/test/test_script.rb') }

  describe '#variables' do
    it 'returns all names of variables asignations' do
      expect(code.variables).to eql([['заплата', [5, 2]], ['salary', [8, 2]]])
    end
  end

  describe '#symbols' do
  it 'returns all names of symbols' do
    expect(code.symbols).to eql([['SomeSymbol', [11, 3]], ['someSymbol', [12, 3]]])
  end
end
end