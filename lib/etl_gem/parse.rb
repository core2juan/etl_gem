module EtlGem
  class Parse
    extend LightService::Action
    expects :source_format

    executed do |context|
      case context.source_format
      when 'csv', :csv
        procesor = CsvProcessor
      when 'json', :json
        procesor = JsonProcessor
      end

      procesor.new(context.source_format).parse
    end
  end
end
