class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :validatable, :confirmable
  GITHUB_URL = 'https://www.github.com/luciengeorge'.freeze
  LINKEDIN_URL = 'https://www.linkedin.com/in/luciengeorge'.freeze
end
