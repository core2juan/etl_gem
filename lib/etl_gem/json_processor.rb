require 'json'
require 'active_support/core_ext/string/inflections'

module EtlGem
  class JsonProcessor < Processor
    private

    def load_source
      @data = {}
      files = file_paths[:json].class == Array ? file_paths[:json] : [file_paths[:json]]

      files.each do |f|
        file = File.read(f)
        read_json(JSON.parse(file, symbolize_names: true))
      end

      @data
    end

    def read_json(json, reference = {})
      json.each do |key, value|
        case value.class.to_s
        when 'Array'
          value.each do |item|
            attributes = item.reject{ |k, v| [Hash, Array].include?(v.class) }
            @data[key] ||= []
            @data[key] << attributes.merge(reference)
            inner_relations = item.select { |_k, v| [Hash, Array].include?(v.class) }
            reference = { :"#{key.to_s.singularize}_id" => attributes[:id] } if attributes[:id]
            inner_relations.keys.each do |relation_key|
              read_json({ relation_key => inner_relations[relation_key] }, reference)
            end
          end
        when 'Hash'
          attributes = value.reject{ |k, v| [Hash, Array].include?(v.class) }
          @data[key] ||= []
          @data[key] << attributes.merge(reference)
          inner_relations = value.select { |_k, v| [Hash, Array].include?(v.class) }
          reference = { :"#{key}_id" => attributes[:id] } if attributes[:id]
          read_json(inner_relations, reference) if inner_relations.any?
        end
      end
    end
  end
end
