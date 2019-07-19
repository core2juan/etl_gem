require 'spec_helper'
require 'etl_gem/processor'
require 'etl_gem/csv_processor'

RSpec.describe EtlGem::CsvProcessor do
  let(:file_paths) { { csv: 'spec/fixtures/csv/example.csv' } }
  let(:expected_data) do
    [
      {
        id: '1',
        name: 'Foo',
        city: 'San Francisco',
        country: 'USA'
      },
      {
        id: '2',
        name: 'Bar',
        city: 'Bogota',
        country: 'CO'
      }
    ]
  end

  subject(:processor) { described_class.new(file_paths) }

  describe '.load_source' do
    it 'returns the csv as hash with its data' do
      expect(processor.send(:load_source)).to eq(expected_data)
    end
  end
end
