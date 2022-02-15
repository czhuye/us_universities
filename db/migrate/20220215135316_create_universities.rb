class CreateUniversities < ActiveRecord::Migration[7.0]
  def change
    create_table :universities do |t|
      t.string :name
      t.string :rank
      t.string :photo
      t.string :zip
      t.string :state
      t.string :city
      t.string :program

      t.timestamps
    end
  end
end
