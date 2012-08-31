require 'fog/core/model'
require 'fog-gridfs/gridfs/models/storage/files'

module Fog
  module Storage
    class Gridfs

      class Directory < Fog::Model

        identity  :key

        def destroy
          requires :key
          false
        end

        def files
          @files ||= begin
            Fog::Storage::Gridfs::Files.new(
              :directory => self,
              :connection => connection
            )
          end
        end

        def save
          requires :key
          true
        end

      end

    end
  end
end

