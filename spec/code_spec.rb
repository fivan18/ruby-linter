RSpec.describe Code do
  let(:code) { Code.new(Dir.pwd + '/spec/test/test_script') }
  let(:code_classes) { Code.new(Dir.pwd + '/spec/test/classes_test_script') }

  describe '#variables' do
    it 'returns variables names from test_script' do
      expect(code.variables).to eql([['CONSTANT', [6, 2]],
                                     ['good_variable', [15, 4]],
                                     ['заплата', [20, 4]],
                                     ['salary', [21, 4]],
                                     ['good_variable', [23, 4]]])
    end
  end

  describe '#symbols' do
    it 'returns symbols names from test_script' do
      expect(code.symbols).to eql([['baп_symbol', [3, 15]],
                                   ['BabSymbol', [3, 29]],
                                   ['good_symbol', [4, 15]],
                                   ['BADSYMBOL', [15, 23]]])
    end
  end

  describe '#classes' do
    it 'returns classes names from test_script' do
      expect(code.classes).to eql([['TestScript', [1, 6]]])
    end

    it 'returns classes names from classes_test_script' do
      expect(code_classes.classes).to eql([['a_class', [4, 6]],
                                           ['anotherClass', [9, 6]],
                                           ['RigthNameCLass', [16, 6]]])
    end
  end

  describe '#methods' do
    it 'returns methods names from test_script' do
      expect(code.methods).to eql([['a_Method', [9, 6]],
                                   ['anotherMethod', [14, 6]],
                                   ['god_method', [18, 6]]])
    end
  end
end
