class Project < ActiveRecord::Base
    mount_uploader :screenshots, ScreenshotUploader
    validates :name, presence: true
    validates :description, presence: true
end
