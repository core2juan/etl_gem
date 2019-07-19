module EtlGem
  class Processor
    attr_accessor :file_paths

    def initialize(file_paths = {})
      @file_paths = file_paths
      validate_presence_of_formats
      load_source
    end

    def process
      raise 'Not implemented'
    end

    private

    def validate_presence_of_formats
      raise 'No format supported' unless (@file_paths.keys & %i(csv json)).size > 0
    end

    def load_source
      raise 'Not implemented'
    end
  end
end
