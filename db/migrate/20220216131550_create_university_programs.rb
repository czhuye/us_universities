class CreateUniversityPrograms < ActiveRecord::Migration[7.0]
  def change
    create_table :university_programs do |t|
      t.references :university, null: false, foreign_key: true
      t.references :program, null: false, foreign_key: true

      t.timestamps
    end
  end
end
