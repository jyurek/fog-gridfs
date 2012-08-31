require 'fog/core/collection'
require 'fog-gridfs/gridfs/models/storage/file'

module Fog
  module Storage
    class Gridfs

      class Files < Fog::Collection

        attribute :directory

        model Fog::Storage::Gridfs::File

        def all
          requires :directory
        end

        def get(key)
          requires :directory
          new(key: key).body
        end

        def head(key)
          requires :directory
        end

        def new(attributes = {})
          requires :directory
          super({ :directory => directory }.merge!(attributes))
        end
      end
    end
  end
end

