class Avatar < ActiveRecord::Base
  include ImageUploader::Attachment(:image)

  belongs_to :user
end
