module EtlGem
  class Organizer
    extend LightService::Organizer

    def self.call(source_format)
      with(source_format: source_format).reduce(Parse)
    end
  end
end
