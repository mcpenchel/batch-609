class CreateInterns < ActiveRecord::Migration[6.0]
  def change
    create_table :interns do |t|
      t.string :first_name
      t.string :last_name
      # t.integer :doctor_id

      t.references  :doctor, foreign_key: true

      # doctor_id
      # doctors_id => DOESN'T WORK
      # id_doctor => DOESN'T WORK

      t.timestamps
    end
  end
end

# interns
# "Carla" - "Valdivia" - 24