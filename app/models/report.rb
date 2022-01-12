class Report < ApplicationRecord
	scope :from_age, -> (age_param) { where("age >= ?", age_param) }
	scope :age_to, -> (age_param) { where("age <= ?", age_param) }
	scope :date_from, -> (date_param) { where("date >= ?", date_param) }
	scope :date_to, -> (date_param) { where("date <= ?", date_param) }
	scope :gender, -> (gender_param) { where gender: gender_param }

	validates_inclusion_of :gender, :in => %w( m f )
end
