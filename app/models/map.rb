class Map < ApplicationRecord

  belongs_to :event

  geocoded_by :address
  after_validation :geocode

end
