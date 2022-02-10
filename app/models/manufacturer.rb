class Manufacturer < ApplicationRecord
  has_many :pianos, dependent: :destroy
end
