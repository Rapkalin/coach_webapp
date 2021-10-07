class Movement < ApplicationRecord
  has_many :sessions,  dependent: :destroy
end
