class List < ActiveRecord::Base
	has_many :items
	has_and_belongs_to_many :categories
	belongs_to :user
end
