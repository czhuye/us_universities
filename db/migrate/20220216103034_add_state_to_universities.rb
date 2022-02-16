class AddStateToUniversities < ActiveRecord::Migration[7.0]
  def change
    add_reference :universities, :state, null: false, foreign_key: true
    remove_column :universities, :state
  end
end
