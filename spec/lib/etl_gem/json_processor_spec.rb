require 'spec_helper'
require 'etl_gem/processor'
require 'etl_gem/json_processor'

RSpec.describe EtlGem::JsonProcessor do
  let(:file_paths) { { json: 'spec/fixtures/json/group_example.json' } }


  subject(:processor) { described_class.new(file_paths) }

  describe '.load_source' do

    it 'returns whateva' do
      binding.pry
    end
  end
end
