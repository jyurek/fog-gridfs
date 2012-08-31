require 'fog/core/collection'
require 'fog-gridfs/gridfs/models/storage/directory'

module Fog
  module Storage
    class Gridfs
      class Directories < Fog::Collection

        model Fog::Storage::Gridfs::Directory

        def all
        end

        def get(key)
        end

      end
    end
  end
end

