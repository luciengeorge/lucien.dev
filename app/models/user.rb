class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :validatable, :confirmable

  OWNERS = %w[lucien-george ImpactLebanon krowl-io].freeze
end
