require 'fog/core/model'

module Fog
  module Storage
    class Gridfs

      class File < Fog::Model

        identity  :key,             :aliases => 'Key'

        attribute :content_length,  :aliases => 'Content-Length', :type => :integer
        attribute :content_type,    :aliases => 'Content-Type'
        attribute :last_modified,   :aliases => 'Last-Modified'
        attribute :directory

        def filename
          requires :directory, :key
          [directory.key, key].join("/")
        end

        def body
          @body ||= read
        end

        def body=(new_body)
          @body = new_body
        end

        def destroy
          requires :directory, :key
        end

        def read
          requires :directory, :key
          connection.open(filename, "r").read
        end

        def save(options = {})
          requires :body, :directory, :key
          file = connection.open(filename, "w", safe: true)
          begin
            if body.respond_to?(:read)
              while(data = body.read)
                file.write(data)
              end
            else
              file.write(body)
            end
          ensure
            file.close
          end
        end
      end
    end
  end
end

