class Movement < ApplicationRecord
  has_many :sessions,  dependent: :destroy
  MOVEMENTS = ["Burpee","Push up","Squat"]
end
