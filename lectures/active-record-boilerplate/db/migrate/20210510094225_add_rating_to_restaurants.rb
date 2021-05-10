class AddRatingToRestaurants < ActiveRecord::Migration[6.0]
  def change
    # add_column :table_name, :column_name, :column_type, options={}
    add_column :restaurants, :rating, :integer, null: false, default: 0
  end
end