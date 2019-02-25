class CreateFlights < ActiveRecord::Migration[5.2]
  def change
    create_table :flights do |t|
      t.references :from_airport, foreign_key: { to_table: :airports }
      t.references :to_airport, foreign_key: { to_table: :airports }
      t.datetime :start
      t.integer :duration

      t.timestamps
    end
  end
end
