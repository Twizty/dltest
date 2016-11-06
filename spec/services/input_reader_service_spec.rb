require_relative '../../services/input_reader_service.rb'

RSpec.describe InputReaderService do
  context '#perform' do
    let(:valid_file_by_lines) do
      ['0 0 0', '0 1 0', '0 0 0']
    end

    let(:invalid_file_by_lines) do
      ['0 0 0', '0 INVALID_VALUE 0', '0 0 0']
    end

    it 'should return map with cells' do
      expect(File).to receive(:readlines).with(anything).and_return(valid_file_by_lines)

      s = InputReaderService.new('some_path')
      map = s.perform

      expect(map[1][1]).to be_alive
    end

    it 'should throw error if input is invalid' do
      expect(File).to receive(:readlines).with(anything).and_return(invalid_file_by_lines)

      s = InputReaderService.new('some_path')

      expect { s.perform }.to raise_error InputReaderService::InvalidInput
    end
  end
end
