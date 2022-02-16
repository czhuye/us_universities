class CreateJoinTableUniversityProgram < ActiveRecord::Migration[7.0]
  def change
    create_join_table :universities, :programs do |t|
      # t.index [:university_id, :program_id]
      # t.index [:program_id, :university_id]
    end
  end
end
