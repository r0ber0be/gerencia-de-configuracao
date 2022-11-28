class CityInfo < ApplicationRecord
  belongs_to :city
  validates :city_id, presence: true, uniqueness: true
end
