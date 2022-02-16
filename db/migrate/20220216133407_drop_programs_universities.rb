class DropProgramsUniversities < ActiveRecord::Migration[7.0]
  def change
    drop_table :programs_universities
  end
end
