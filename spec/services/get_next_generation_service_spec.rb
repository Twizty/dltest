require_relative '../../services/get_next_generation_service.rb'
require_relative '../../models/cell.rb'

RSpec.describe GetNextGenerationService do
  context 'cycle case test' do
    let(:map) do
      [
        [Cell.dead, Cell.dead,  Cell.dead,  Cell.dead,  Cell.dead],
        [Cell.dead, Cell.dead,  Cell.dead,  Cell.dead,  Cell.dead],
        [Cell.dead, Cell.alive, Cell.alive, Cell.alive, Cell.dead],
        [Cell.dead, Cell.dead,  Cell.dead,  Cell.dead,  Cell.dead],
        [Cell.dead, Cell.dead,  Cell.dead,  Cell.dead,  Cell.dead],
      ]
    end

    it 'should be turned' do
      step_res = GetNextGenerationService.new(map).perform
      result = step_res[1][2].alive? && step_res[2][2].alive? && step_res[3][2].alive?
      expect(result).to eq true
    end

    it 'should be equal' do
      step_res1 = GetNextGenerationService.new(map).perform
      step_res2 = GetNextGenerationService.new(step_res1).perform
      result = step_res2[2][1].alive? && step_res2[2][2].alive? && step_res2[2][3].alive?
      expect(result).to eq true
    end
  end

  context 'stable case test' do
    let(:map) do
      [
        [Cell.dead, Cell.dead,  Cell.dead,  Cell.dead,  Cell.dead,  Cell.dead],
        [Cell.dead, Cell.dead,  Cell.dead,  Cell.dead,  Cell.dead,  Cell.dead],
        [Cell.dead, Cell.alive, Cell.alive, Cell.alive, Cell.alive, Cell.dead],
        [Cell.dead, Cell.dead,  Cell.dead,  Cell.dead,  Cell.dead,  Cell.dead],
        [Cell.dead, Cell.dead,  Cell.dead,  Cell.dead,  Cell.dead,  Cell.dead],
        [Cell.dead, Cell.dead,  Cell.dead,  Cell.dead,  Cell.dead,  Cell.dead],
      ]
    end

    it 'should be return different value' do
      step_res = GetNextGenerationService.new(map).perform
      result = 
        step_res[1][2].alive? && step_res[1][3].alive? &&
        step_res[2][2].alive? && step_res[2][3].alive? &&
        step_res[3][2].alive? && step_res[3][3].alive?

      expect(result).to eq true
    end

    it 'should be return the same value' do
      step1 = GetNextGenerationService.new(map).perform
      step2 = GetNextGenerationService.new(step1).perform
      step3 = GetNextGenerationService.new(step2).perform
      result = 
        step2[1][2].alive? && step2[1][3].alive? &&
        step2[2][1].alive? && step2[2][4].alive? &&
        step2[3][2].alive? && step2[3][3].alive? &&
        step3[1][2].alive? && step3[1][3].alive? &&
        step3[2][1].alive? && step3[2][4].alive? &&
        step3[3][2].alive? && step3[3][3].alive?

      expect(result).to eq true
    end
  end

  context 'various case test' do
    let(:map) do
      [
        [Cell.dead, Cell.dead, Cell.dead,  Cell.dead,  Cell.dead,  Cell.dead,  Cell.dead,  Cell.dead, Cell.dead],
        [Cell.dead, Cell.dead, Cell.dead,  Cell.dead,  Cell.dead,  Cell.dead,  Cell.dead,  Cell.dead, Cell.dead],
        [Cell.dead, Cell.dead, Cell.dead,  Cell.dead,  Cell.dead,  Cell.dead,  Cell.dead,  Cell.dead, Cell.dead],
        [Cell.dead, Cell.dead, Cell.dead,  Cell.dead,  Cell.dead,  Cell.dead,  Cell.dead,  Cell.dead, Cell.dead],
        [Cell.dead, Cell.dead, Cell.alive, Cell.alive, Cell.alive, Cell.alive, Cell.alive, Cell.dead, Cell.dead],
        [Cell.dead, Cell.dead, Cell.dead,  Cell.dead,  Cell.dead,  Cell.dead,  Cell.dead,  Cell.dead, Cell.dead],
        [Cell.dead, Cell.dead, Cell.dead,  Cell.dead,  Cell.dead,  Cell.dead,  Cell.dead,  Cell.dead, Cell.dead],
        [Cell.dead, Cell.dead, Cell.dead,  Cell.dead,  Cell.dead,  Cell.dead,  Cell.dead,  Cell.dead, Cell.dead],
        [Cell.dead, Cell.dead, Cell.dead,  Cell.dead,  Cell.dead,  Cell.dead,  Cell.dead,  Cell.dead, Cell.dead],
      ]
    end

    it 'should be different' do 
      exprestion = true
      first = GetNextGenerationService.new(map).perform
      second = GetNextGenerationService.new(first).perform
      exprestion &&= first != second
      third = GetNextGenerationService.new(second).perform
      exprestion &&= (first != third && third != second)
      fourth = GetNextGenerationService.new(third).perform
      exprestion &&= (first != fourth && second != fourth && third != fourth)
      fifth = GetNextGenerationService.new(fourth).perform
      exprestion &&= (first != fifth && second != fifth && third != fifth && fourth != fifth)

      expect(exprestion).to eq true
    end
  end

  context '#next_to' do
    ms = GetNextGenerationService.new [
      [Cell.dead, Cell.dead,  Cell.dead,  Cell.dead,  Cell.dead],
      [Cell.dead, Cell.dead,  Cell.dead,  Cell.dead,  Cell.dead],
      [Cell.dead, Cell.alive, Cell.alive, Cell.alive, Cell.dead],
      [Cell.dead, Cell.dead,  Cell.dead,  Cell.dead,  Cell.dead],
      [Cell.dead, Cell.dead,  Cell.dead,  Cell.dead,  Cell.dead],
    ]

    it 'should return correct values' do
      expect(ms.next_to(0, 0)).to include(ms.map[0][1], ms.map[1][1], ms.map[1][0], ms.map[-1][-1])
    end
  end
end
