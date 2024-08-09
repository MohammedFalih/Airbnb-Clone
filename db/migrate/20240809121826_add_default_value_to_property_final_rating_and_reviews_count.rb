class AddDefaultValueToPropertyFinalRatingAndReviewsCount < ActiveRecord::Migration[7.2]
  def change
    change_column :properties, :reviews_count, :integer, default: 0
    change_column :properties, :average_final_rating, :decimal, default: 0
  end
end
