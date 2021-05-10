class CreateRestaurants < ActiveRecord::Migration[6.0]
  # If it's not change,
  # nothing will work.
  def change
    # the symbol is the table_name (always in plural!!!)
    create_table :restaurants do |t|
      t.string :name # t.column_type :column_name
      t.string :address
      t.timestamps # add 2 columns, `created_at` and `updated_at`
    end
  end
end