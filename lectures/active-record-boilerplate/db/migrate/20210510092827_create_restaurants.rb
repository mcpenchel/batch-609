# Naming conventions:
# file -> TIMESTAMP_lower_snake_case in plural
# ex: 20210510092827_create_restaurants.rb
# class -> UpperCamelCase in plural
# ex: CreateRestaurants

class CreateRestaurants < ActiveRecord::Migration[6.0]
  # Sacred method name!! Change
  def change
    # the symbol is the table_name (always in plural!!!)
    create_table :restaurants do |t|
      t.string :name # t.column_type :column_name
      t.string :address
      t.timestamps # add 2 columns, `created_at` and `updated_at`
    end
  end
end