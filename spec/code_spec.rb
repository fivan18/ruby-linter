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

  describe '#classes' do
    it 'returns all names of classes' do
      expect(code.classes).to eql([['TestScript', [3, 6]]])
    end
  end

  describe '#methods' do
    it 'returns all names of methos' do
      expect(code.methods).to eql([['a_Method', [14, 6]], ['anotherMethod', [18, 6]]])
    end
  end
end