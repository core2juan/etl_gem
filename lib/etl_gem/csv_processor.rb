module EtlGem
  class CsvProcessor < Processor
    private

    def load_source
      @data = []

      csv = CSV.read(path_to_file, headers: true)

      csv.each do |row|
        content = {}
        csv.headers.each do |header|
          content[header.to_sym] = row[header]
        end
        @data << content
      end

      @data
    end
  end
end
