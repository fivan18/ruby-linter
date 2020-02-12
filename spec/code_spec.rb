RSpec.describe Code do
  let(:code) { Code.new(Dir.pwd + '/spec/test/test_script') }

  describe '#variables' do
    it 'returns all names of variables asignations' do
      expect(code.variables).to eql([['заплата', [3, 2]], ['salary', [6, 2]]])
    end
  end

  describe '#symbols' do
    it 'returns all names of symbols' do
      expect(code.symbols).to eql([['SomeSymbol', [8, 3]], ['someSymbol', [9, 3]]])
    end
  end

  describe '#classes' do
    it 'returns all names of classes' do
      expect(code.classes).to eql([['TestScript', [1, 6]]])
    end
  end

  describe '#methods' do
    it 'returns all names of methos' do
      expect(code.methods).to eql([['a_Method', [11, 6]], ['anotherMethod', [15, 6]]])
    end
  end
end
