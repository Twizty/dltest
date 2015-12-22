require_relative '../map_service.rb'

RSpec.describe MapService do
  context 'cycle case test' do
    ms = MapService.new [
      [Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false)],
      [Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false)],
      [Cell.new(false), Cell.new(true), Cell.new(true), Cell.new(true), Cell.new(false)],
      [Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false)],
      [Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false)],
    ]

    it 'should be turned' do
      step_res = ms.step
      result = step_res[1][2].alive? && step_res[2][2].alive? && step_res[3][2].alive?
      expect(result).to eq true
    end

    it 'should be equal' do
      step_res = ms.step
      result = step_res[2][1].alive? && step_res[2][2].alive? && step_res[2][3].alive?
      expect(result).to eq true
    end
  end

  context 'stable case test' do
    ms = MapService.new [
      [Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false)],
      [Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false)],
      [Cell.new(false), Cell.new(true), Cell.new(true), Cell.new(true), Cell.new(true), Cell.new(false)],
      [Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false)],
      [Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false)],
      [Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false)],
    ]

    it 'should be return different value' do
      step_res = ms.step
      result = 
        step_res[1][2].alive? && step_res[1][3].alive? &&
        step_res[2][2].alive? && step_res[2][3].alive? &&
        step_res[3][2].alive? && step_res[3][3].alive?

      expect(result).to eq true
    end

    it 'should be return the same value' do
      step2 = ms.step
      step3 = ms.step
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
    ms = MapService.new [
      [Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false)],
      [Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false)],
      [Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false)],
      [Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false)],
      [Cell.new(false), Cell.new(false), Cell.new(true), Cell.new(true), Cell.new(true), Cell.new(true), Cell.new(true), Cell.new(false), Cell.new(false)],
      [Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false)],
      [Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false)],
      [Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false)],
      [Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false)],
    ]

    it 'should be different' do 
      exprestion = true
      first = Marshal.load(Marshal.dump(ms.step))
      second = Marshal.load(Marshal.dump(ms.step))
      exprestion &&= first != second
      third = Marshal.load(Marshal.dump(ms.step))
      exprestion &&= (first != third && third != second)
      fourth = Marshal.load(Marshal.dump(ms.step))
      exprestion &&= (first != fourth && second != fourth && third != fourth)
      fifth = Marshal.load(Marshal.dump(ms.step))
      exprestion &&= (first != fifth && second != fifth && third != fifth && fourth != fifth)

      expect(exprestion).to eq true
    end
  end
end
