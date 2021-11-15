class Training < ApplicationRecord
  belongs_to :coach
  belongs_to :user
  belongs_to :movement
end
