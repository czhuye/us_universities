class CreateStates < ActiveRecord::Migration[7.0]
  def change
    create_table :states do |t|
      t.string :state
      t.string :latitude
      t.string :longitude
      t.string :name

      t.timestamps
    end
  end
end
