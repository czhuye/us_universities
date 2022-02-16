class Program < ApplicationRecord
  has_many :universities, through: :university_programs
end
