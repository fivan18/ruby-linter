RSpec.describe Validator do
  let(:validator) { Validator.new(Dir.pwd + '/spec/test/test_script.rb') }

  describe '#validate' do
    it 'returns all non ascii variable names' do
      expect(validator.validate(:variables, :ascii)).to eql([['заплата', [5, 2]]])
    end
  end
end