class Project < ActiveRecord::Base
    mount_uploader :screenshots, ScreenshotUploader
    validates_presence_of :screenshots, message: 'Vous devez lier au moins un screenshot au projet.'
    validates_integrity_of :screenshots, message: 'L\'intégrité du screenshot est compromise, veuillez reéssayer.'
    validates_processing_of :screenshots, message: 'Votre screenshot n\'a pas été correctement uploadé, veuillez reéssayer.'
    validates :name, presence: true
    validates :description, presence: true, length: {minimum: 5, maximum: 1500, message: 'La description doit être comprise entre 5 et 1500 caractères.'}
    validates_numericality_of :project_duration, only_integer: true, greater_than_or_equal_to: 0, message: 'La durée du projet ne peut être négative.'
end
