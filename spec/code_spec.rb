RSpec.describe Code do
  let(:code) { Code.new('./test_code/test_code.rb') }

  describe '#' do
    it '' do
      expect(dashboard.add_move('1', '✘')).to eql(true)
    end
  end
end