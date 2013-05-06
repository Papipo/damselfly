class Person < ActiveRecord::Base
  attr_accessible :name
  include Damselfly
  has_one_attached :avatar
  has_one_attached :logo
  has_many_attached :photos
  attr_accessible :avatar_attributes, :logo_attributes, :photos_attributes
end
