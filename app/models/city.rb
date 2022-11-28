class City < ApplicationRecord
  has_one :city_info
  accepts_nested_attributes_for :city_info
  validates :name, presence: true, uniqueness: true
  validates :state, :pop1991, :pop2000, :pop2010, presence: true
  # Kaminari
  paginates_per 15
end
