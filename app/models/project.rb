class Project < ActiveRecord::Base
    mount_uploader :screenshots, ScreenshotUploader
    validates :name, presence: true
    validates :description, presence: true
    validates_numericality_of :project_duration, :only_integer =>true, :greater_than_or_equal_to =>0
end
