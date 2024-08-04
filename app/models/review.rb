class Review < ApplicationRecord
  belongs_to :user
  belongs_to :property, counter_cache: true

  validates :content, presence: :true
  validates :cleanliness_rating, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :accuracy_rating, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :check_in_rating, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :communication_rating, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :location_rating, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :value_rating, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }

  after_commit :set_final_rating, on: [ :create, :update ]

  def set_final_rating
    total_ratings = cleanliness_rating + accuracy_rating + check_in_rating + communication_rating + location_rating + value_rating

    update_column(:final_rating, total_ratings.to_f / 6)

    property.set_average_rating
  end
end