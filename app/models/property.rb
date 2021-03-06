class Property < ApplicationRecord
  #associations
  has_many_attached :images
  
  belongs_to :owner, class_name: "Landlord"
  has_many :favorites
  has_many :likers, through: :favorites, source: :user

  #validations
  # validates :operation_type, presence: true
  # validates :addres, presence: true,
  # validates :monthly_rent, presence: true
  # validates :property_type, presence: true

  enum operation_type: [:sell, :rent]
  enum property_type: [:apartment, :house]
end
