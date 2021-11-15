class Movement < ApplicationRecord
  has_many :trainings,  dependent: :destroy
  MOVEMENTS = ["Burpee","Push up","Squat"]
end
