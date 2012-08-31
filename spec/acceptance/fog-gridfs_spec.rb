require 'spec_helper'

describe Fog::Gridfs do
  it 'can load the adapter with minimal arguments' do
    storage = Fog::Storage.new(provider: :grid_fs, host: "localhost", database: "football")
  end

  xit 'can load the adapter with additional arguments' do
    # Actually works, but creds are bad.
    storage = Fog::Storage.new(
      provider: :grid_fs,
      host: "localhost",
      port: 27017,
      database: "football",
      username: "username",
      password: "password"
    )
  end

  it 'can create a "bucket" with a file in it, then confirm it is there' do
    storage = Fog::Storage.new(provider: :grid_fs, host: "localhost", database: "football")
    bucket = storage.directories.create(key: "goalline")
    file = bucket.files.new({
      key: "touchdown.txt",
      body: "This is not an image file."
    })
    file.save

    reloaded_file = bucket.files.new(key: "touchdown.txt")
    reloaded_file.body.should == "This is not an image file."
  end

  it 'can fetch the file with #get' do
    storage = Fog::Storage.new(provider: :grid_fs, host: "localhost", database: "baseball")
    bucket = storage.directories.new(key: "infield")
    file_body = "Not a belly itcher. 0.51 ERA, so that's legit."
    file = bucket.files.new({
      key: "pitcher.txt",
      body: file_body
    })
    file.save

    bucket.files.get('pitcher.txt').should == file_body
  end
end
