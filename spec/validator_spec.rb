RSpec.describe Validator do
  let(:validator) { Validator.new(Dir.pwd + '/spec/test/test_script') }
  let(:validator_classes) { Validator.new(Dir.pwd + '/spec/test/classes_test_script') }

  describe '#validate' do
    it 'returns all non-ascii variables names' do
      expect(validator.validate(:variables, :ascii)).to eql([['заплата', [20, 4]]])
    end

    it 'returns all non-ascii symbols names' do
      expect(validator.validate(:symbols, :ascii)).to eql([['baп_symbol', [3, 15]]])
    end

    it 'returns all non-ascii methods names' do
      expect(validator.validate(:methods, :ascii)).to eql([])
    end

    it 'returns all non-ascii classes names' do
      expect(validator_classes.validate(:classes, :ascii)).to eql([])
    end

    it 'returns all non-snakecase variables names' do
      expect(validator.validate(:variables, :snakecase)).to eql([])
    end

    it 'returns all non-snakecase symbols names' do
      expect(validator.validate(:symbols, :snakecase)).to eql([['BabSymbol', [3, 29]],
                                                               ['BADSYMBOL', [15, 23]]])
    end

    it 'returns all non-snakecase methods names' do
      expect(validator.validate(:methods, :snakecase)).to eql([['a_Method', [9, 6]],
                                                               ['anotherMethod', [14, 6]]])
    end

    it 'returns all non-snakecase classes names' do
      expect(validator_classes.validate(:classes, :snakecase)).to eql([['anotherClass', [9, 6]],
                                                                       ['RigthNameCLass', [16, 6]]])
    end

    it 'returns all non-camelcase variables names' do
      expect(validator.validate(:variables, :camelcase)).to eql([['CONSTANT', [6, 2]],
                                                                 ['good_variable', [15, 4]],
                                                                 ['заплата', [20, 4]],
                                                                 ['salary', [21, 4]],
                                                                 ['good_variable', [23, 4]]])
    end

    it 'returns all non-camelcase symbols names' do
      expect(validator.validate(:symbols, :camelcase)).to eql([['baп_symbol', [3, 15]],
                                                               ['good_symbol', [4, 15]],
                                                               ['BADSYMBOL', [15, 23]]])
    end

    it 'returns all non-camelcase methods names' do
      expect(validator.validate(:methods, :camelcase)).to eql([['a_Method', [9, 6]],
                                                               ['anotherMethod', [14, 6]],
                                                               ['god_method', [18, 6]]])
    end

    it 'returns all non-camelcase classes names' do
      expect(validator_classes.validate(:classes, :camelcase)).to eql([['a_class', [4, 6]],
                                                                       ['anotherClass', [9, 6]]])
    end
  end
end
