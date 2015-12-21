require_relative '../cell.rb'

RSpec.describe Cell do
  context 'states' do
    it 'should be dead after empty initialization' do
      c = Cell.new

      expect(c.dead?).to eq true
    end

    it 'should be dead after initialization' do
      c = Cell.new(true)

      expect(c.alive?).to eq true
    end

    it 'should be dead after initialization' do
      c = Cell.new
      c.live!

      expect(c.alive?).to eq true
    end

    it 'should be dead after initialization' do
      c = Cell.new
      c.die!

      expect(c.dead?).to eq true
    end
  end
end
