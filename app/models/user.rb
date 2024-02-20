class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  has_secure_password
  has_many :recipes, dependent: :destroy
  has_many :comments, dependent: :destroy

    def full_name
        "#{first_name} #{last_name}"
      end
end