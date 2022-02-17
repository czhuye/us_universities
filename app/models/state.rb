class State < ApplicationRecord
  validates :state, :latitude, :name, :longitude, presence: true
  validates :state, :name, uniqueness: true
  has_many :universities
end
