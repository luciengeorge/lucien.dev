class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :validatable, :confirmable
  GITHUB_URL = 'https://www.github.com/lucien-george'
  LINKEDIN_URL = 'https://www.linkedin.com/in/luciengeorge'
end
