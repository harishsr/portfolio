class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable

  validates :username, presence: true, length: { minimum: 6 }
  validates :first_name, :last_name, presence: true, length: { in: 2..25 }
end
