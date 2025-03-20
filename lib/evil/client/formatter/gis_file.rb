module Evil::Client::Formatter
  #
  # Utility module to format file (IO) as a part of multipart body
  #
  # @example
  #   Evil::Client::Formatter::Form.call foo: { bar: :baz }
  #   # => "foo[bar]=baz"
  #
  module GisFile
    extend self
    require_relative "gis_part"

    # Formats nested hash as a string
    #
    # @param  [Array<IO>] value
    # @option opts [String] :boundary
    # @return [String]
    #
    def call(sources, boundary:, **)
      context, file = sources.flatten
      parts = params(**context).map do |key, value|
        "--#{boundary}\r\n#{params_part(key, value)}"
      end

      parts << "--#{boundary}\r\n#{part(file, nil)}"


      [nil, nil, parts, "--#{boundary}--", nil].join("\r\n")
    end

    private

    def params(context:, filename:, filesize:)
      {
        context: context,
        description: filename,
        fileName: filename,
        chunkNumber: 1,
        totalChunks: 1,
        fileSize: filesize,
        flowChunkNumber: 1,
        flowChunkSize: 5242880,
        flowCurrentChunkSize: filesize,
        flowTotalSize: filesize,
        flowIdentifier: "#{filesize}-#{filename}".gsub(/[^\d\-_a-zA-Z]*/, ''), # без русских букв и точек, только разрешенные символы
        flowFilename: filename,
        flowRelativePath: filename,
        flowTotalChunks: 1,
      }
    end

    def params_part(name, value)
      disposition = "Content-Disposition: form-data; name=\"#{name}\""
      [disposition, nil, value].join("\r\n")
    end

    def part(source, index)
      GisPart.call(source, index)
    end
  end
end
