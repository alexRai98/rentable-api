class Favorite < ApplicationRecord
  #associations
  belongs_to :user, class_name: "HomeSeeker"
  belongs_to :property, counter_cache: true
end
