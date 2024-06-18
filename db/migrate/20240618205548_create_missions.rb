class CreateMissions < ActiveRecord::Migration[7.1]
  def change
    create_table :missions do |t|
      t.references :listing, null: false, foreign_key: true
      t.integer :mission_type, null: false, default: 0, index: true
      t.integer :price
      t.date :date

      t.timestamps
    end
  end
end
