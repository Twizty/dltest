require_relative '../../forms/cell_form.rb'

RSpec.describe CellForm do
  context '#valid?' do
    it 'should be valid when initialized with 1' do
      c = CellForm.new(1)
      expect(c).to be_valid
    end

    it 'should be valid when initialized with \'1\'' do
      c = CellForm.new('1')
      expect(c).to be_valid
    end

    it 'should be valid when initialized with true' do
      c = CellForm.new(true)
      expect(c).to be_valid
    end

    it 'should be valid when initialized with \'true\'' do
      c = CellForm.new('true')
      expect(c).to be_valid
    end

    it 'should be valid when initialized with 0' do
      c = CellForm.new(0)
      expect(c).to be_valid
    end

    it 'should be valid when initialized with \'0\'' do
      c = CellForm.new('0')
      expect(c).to be_valid
    end

    it 'should be valid when initialized with false' do
      c = CellForm.new(false)
      expect(c).to be_valid
    end

    it 'should be valid when initialized with \'false\'' do
      c = CellForm.new('false')
      expect(c).to be_valid
    end
  end

  context '#cell' do
    it 'should be alive when initialized with 1' do
      c = CellForm.new(1)
      expect(c.cell).to be_alive
    end

    it 'should be alive when initialized with \'1\'' do
      c = CellForm.new('1')
      expect(c.cell).to be_alive
    end

    it 'should be alive when initialized with true' do
      c = CellForm.new(true)
      expect(c.cell).to be_alive
    end

    it 'should be alive when initialized with \'true\'' do
      c = CellForm.new('true')
      expect(c.cell).to be_alive
    end

    it 'should be dead when initialized with 0' do
      c = CellForm.new(0)
      expect(c.cell).to be_dead
    end

    it 'should be dead when initialized with \'0\'' do
      c = CellForm.new('0')
      expect(c.cell).to be_dead
    end

    it 'should be dead when initialized with false' do
      c = CellForm.new(false)
      expect(c.cell).to be_dead
    end

    it 'should be dead when initialized with \'false\'' do
      c = CellForm.new('false')
      expect(c.cell).to be_dead
    end
  end
end
