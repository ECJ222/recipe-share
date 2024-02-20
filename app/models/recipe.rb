require_relative "../uploaders/image_uploader"

class Recipe < ApplicationRecord
    validates :name, presence: true
    validates :description, presence: true
    validates :image, presence: true
    belongs_to :user
    has_many :comments, dependent: :destroy
    include ImageUploader::Attachment(:image)
end