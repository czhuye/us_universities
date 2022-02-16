class RemoveStateToUniversities < ActiveRecord::Migration[7.0]
  def change
    remove_column :universities, :state
  end
end
