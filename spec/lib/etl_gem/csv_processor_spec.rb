require 'spec_helper'

RSpec.describe CsvProcessor do
  let(:path_to_file) { 'spec/fixtures/example.csv' }
  let(:expected_data) do
    [
      {
        id: 1,
        name: 'Foo',
        city: 'San Francisco',
        country: 'USA'
      },
      {
        id: 2,
        name: 'Bar',
        city: 'Bogota',
        country: 'CO'
      }
    ]
  end

  subject(:processor) { described_class.new(path_to_file) }

  describe '.load_source' do
    it 'returns the csv as hash with its data' do
      expect(processord.send(:load_source)).to be(expected_data)
    end
  end
end
