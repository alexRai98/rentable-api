class Property < ApplicationRecord
  #associations
  has_many_attached :images
  
  belongs_to :owner, class_name: "User"
  has_many :favorites
  has_many :likers, through: :favorites, source: :user
end
