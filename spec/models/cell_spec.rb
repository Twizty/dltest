require_relative '../../models/cell.rb'

RSpec.describe Cell do
  context 'states' do
    context '::dead' do
      it 'should be dead' do
        c = Cell.dead

        expect(c).to be_dead
      end
    end

    context '::alive' do
      it 'should be alive' do
        c = Cell.alive

        expect(c).to be_alive
      end
    end
  end
end
