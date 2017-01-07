class ServiceMenu < ActiveRecord::Base
  mount_uploader :menu, ServiceUploader
  belongs_to :user
end
