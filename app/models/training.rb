class Training < ApplicationRecord
  belongs_to :coach
  belongs_to :user
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  # has_many :movements, dependent: :destroy
end
