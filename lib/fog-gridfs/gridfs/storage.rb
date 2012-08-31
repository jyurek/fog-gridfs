require 'fog/storage'
require 'mongo'

module Fog
  module Storage
    class Gridfs < Fog::Service

      requires :host, :database
      recognizes :username, :password, :port

      model_path 'fog-gridfs/gridfs/models/storage'
      collection :directories
      model      :directory
      collection :files
      model      :file

      class Mock

      end

      class Real

        attr_reader :fs

        def initialize(options = {})
          host = options[:host]
          port = options[:port] || Mongo::Connection::DEFAULT_PORT
          database = options[:database]
          username = options[:username]
          password = options[:password]

          @connection = Mongo::Connection.new(host, port)
          @database = @connection.db(database)
          if username
            @database.authenticate(username, password)
          end

          @fs = Mongo::GridFileSystem.new(@database)
        end

        def open(*args)
          @fs.open(*args)
        end

      end

    end
  end
end
