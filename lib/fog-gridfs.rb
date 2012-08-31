require "fog-gridfs/version"
require 'fog'

module Fog
  module Storage

    def self.new_with_gridfs(attributes)
      duped_attributes = attributes.dup
      provider = duped_attributes.delete(:provider)
      if provider == :grid_fs
        require 'fog-gridfs/gridfs/storage'
        Fog::Storage::Gridfs.new(duped_attributes)
      else
        new_without_gridfs(attributes)
      end
    end

    class << self
      alias_method :new_without_gridfs, :new
      alias_method :new, :new_with_gridfs
    end

  end
end
