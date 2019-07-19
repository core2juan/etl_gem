require 'spec_helper'
require 'etl_gem/processor'
require 'etl_gem/json_processor'

RSpec.describe EtlGem::JsonProcessor do
  let(:file_paths) { { json: 'spec/fixtures/json/group_example.json' } }


  subject(:processor) { described_class.new(file_paths) }

  describe '.load_source' do

    it 'returns whateva' do
      expect(processor.send(:load_source)).to eq(
        {
          groups: [
            {
              id: 1,
              name: 'Group 1'
            }
          ],
          relation_one_to_one: [
            {
              id: 1,
              name: 'Foo',
              group_id: 1
            }
          ],
          relation_one_to_many: [
            {
              id: 1,
              name: 'Bar',
              group_id: 1
            }
          ]
        }
      )
    end
  end
end
