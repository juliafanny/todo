class User < ActiveRecord::Base
	attr_accessible :email, :password, :password_confirmation
	has_secure_password

	has_many :project_memberships
	has_many :projects, :through => :project_memberships
	has_many :comments

	validates :email, :presence => true, :uniqueness => true,
										:format => {:with => /^(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})$/i }
end