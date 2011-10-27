class Task < ActiveRecord::Base
	has_many :comments
	belongs_to :project
	belongs_to :user

	validates :name, :presence => true #, :uniqueness => true
end
