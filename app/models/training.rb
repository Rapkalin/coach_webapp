class Training < ApplicationRecord
  belongs_to :coach
  belongs_to :user
  has_many :movements, dependent: :destroy
end
