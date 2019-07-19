module EtlGem
  class Processor
    attr_accessor :path_to_file

    def initialize(path_to_file)
      @path_to_file = path_to_file
    end

    private

    def load_source
      raise "Not implemented"
    end
  end
end
