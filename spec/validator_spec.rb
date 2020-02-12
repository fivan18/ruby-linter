RSpec.describe Validator do
  let(:validator) { Validator.new(Dir.pwd + '/spec/test/test_script') }

  describe '#validate' do
    it 'returns all non ascii variable names' do
      expect(validator.validate(:variables, :ascii)).to eql([['заплата', [3, 2]]])
    end

    it 'returns all non snakecase variable names' do
      expect(validator.validate(:variables, :snakecase)).to eql([])
    end

    it 'returns all non camelcase class names' do
      expect(validator.validate(:classes, :camelcase)).to eql([])
    end
  end
end
