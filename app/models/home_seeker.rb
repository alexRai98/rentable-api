class HomeSeeker < User
  has_many :favorites, foreign_key: :user_id
  has_many :favorited_properties, through: :favorites, source: :property
end