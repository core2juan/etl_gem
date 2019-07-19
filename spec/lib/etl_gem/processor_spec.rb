require 'spec_helper'
require 'etl_gem/processor'

RSpec.describe EtlGem::Processor do
  subject(:processor) { described_class.new(file_paths) }

  describe 'validations' do
    before(:each) do
      allow_any_instance_of(described_class).to receive(:load_source).and_return(nil)
    end

    context 'when the file paths dont have the supported format' do
      let(:file_paths) { {} }

      it 'raises an exception' do
        expect { processor }.to raise_error('No format supported')
      end
    end

    context 'when the file paths have a csv supported format' do
      let(:file_paths) { { csv: 'example.jsv' } }

      it 'does not rais an exception' do
        expect { processor }.to_not raise_error
      end
    end

    context 'when the file paths have a json supported format' do
      let(:file_paths) { { json: 'example.json' } }

      it 'does not rais an exception' do
        expect { processor }.to_not raise_error
      end
    end
  end

  describe '.process' do
    let(:file_paths) { { csv: 'example.csv', json: 'example.json' } }

    before do
      allow_any_instance_of(described_class).to receive(:load_source).and_return(nil)
    end

    it 'raises a not implemented error' do
      expect { processor.process }.to raise_error('Not implemented')
    end
  end

  describe '.load_source' do
    let(:file_paths) { { csv: 'example.csv', json: 'example.json' } }

    it 'raises a not implemented error' do
      expect { processor }.to raise_error('Not implemented')
    end
  end
end
