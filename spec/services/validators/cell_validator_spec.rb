require_relative '../../../services/validators/cell_validator.rb'

RSpec.describe Validators::CellValidator do
  context '#valid?' do
    let(:invalid_value) { 'INVALID_VALUE' }

    it 'should be valid when initialized with 1' do
      c = described_class.new(1)
      expect(c).to be_valid
    end

    it 'should be valid when initialized with \'1\'' do
      c = described_class.new('1')
      expect(c).to be_valid
    end

    it 'should be valid when initialized with true' do
      c = described_class.new(true)
      expect(c).to be_valid
    end

    it 'should be valid when initialized with \'true\'' do
      c = described_class.new('true')
      expect(c).to be_valid
    end

    it 'should be valid when initialized with 0' do
      c = described_class.new(0)
      expect(c).to be_valid
    end

    it 'should be valid when initialized with \'0\'' do
      c = described_class.new('0')
      expect(c).to be_valid
    end

    it 'should be valid when initialized with false' do
      c = described_class.new(false)
      expect(c).to be_valid
    end

    it 'should be valid when initialized with \'false\'' do
      c = described_class.new('false')
      expect(c).to be_valid
    end

    it "should be valid when initialized with invalid value" do
      c = described_class.new(invalid_value)
      expect(c).not_to be_valid
    end
  end
end
