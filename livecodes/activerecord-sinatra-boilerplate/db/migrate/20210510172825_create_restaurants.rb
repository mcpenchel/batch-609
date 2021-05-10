class CreateRestaurants < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.integer :capacity
    
      t.timestamps
    end
  end
end

# After creating this beautiful migration file,
# we need to rake db:migrate in the terminal
# to actually execute it!

# Remember, a migration is a SET OF INSTRUCTIONS of how
# to change the DB. rake db:migrate is what actually
# executes those instructions.