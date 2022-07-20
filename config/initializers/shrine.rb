require "shrine"
require "shrine/storage/file_system"

if Rails.env.test?
  require 'shrine/storage/memory'
  Shrine.storages = {
    cache: Shrine::Storage::Memory.new,
    store: Shrine::Storage::Memory.new
  }
else
  require "shrine/storage/s3"
  s3_options = {
    access_key_id: Rails.application.credentials[:aws][:access_key_id],
    secret_access_key: Rails.application.credentials[:aws][:secret_access_key],
    region: "eu-central-1",
    bucket: 'mykola-hospital-test'
  }
  Shrine.storages = {
    cache: Shrine::Storage::S3.new(prefix: "cache", **s3_options),
    store: Shrine::Storage::S3.new(prefix: "store", **s3_options)
  }
end
Shrine.plugin :activerecord
Shrine.plugin :cached_attachment_data
Shrine.plugin :restore_cached_data

