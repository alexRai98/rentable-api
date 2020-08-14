class Property < ApplicationRecord
  #associations
  belongs_to :owner, class_name: "User"
  has_many :favorites
  has_many :likers, through: :favorites, source: :user
end
