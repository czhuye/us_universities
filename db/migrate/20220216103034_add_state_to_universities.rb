class AddStateToUniversities < ActiveRecord::Migration[7.0]
  def change
    add_reference :universities, :state, null: false, foreign_key: true
  end
end
