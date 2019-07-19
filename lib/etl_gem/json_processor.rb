require 'json'

module EtlGem
  class JsonProcessor < Processor
    private

    def load_source
      @data = {}
      files = file_paths[:json].class == Array ? file_paths[:json] : [file_paths[:json]]

      files.each do |f|
        file = File.read(f)
        @data.merge!(read_json(JSON.parse(file, symbolize_names: true)))
      end

      @data
    end

    def read_json(json, reference = {})
      content = {}
      json.each do |key, value|
        case value.class.to_s
        when 'Array'
          content[key] = []
          value.each do |item|
            content[key] << read_json(item, reference)
          end
        when 'Hash'
          content[key] = {}
          content[key] = reference
          content[key].merge!(value.reject { |_k, v| [Hash, Array].include?(v.class) })

          reference = { :"#{key}_id" => content[key][:id] } if content[key][:id]
          content[key].merge!(
            read_json(value.select { |_k, v| [Hash, Array].include?(v.class) }, reference)
          )
        end
      end

      content
    end
  end
end
