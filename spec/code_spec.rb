RSpec.describe Code do
  let(:code) { Code.new('test_code.rb') }

  describe '#bad_identifiers' do
    it 'returns indetifiers that are not ascii-only' do
      expect(code.bad_identifiers).to eql([['заплата', [5, 2]]])
    end
  end
end