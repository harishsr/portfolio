# frozen_string_literal: true

class Admin < ApplicationRecord
  has_many :entries, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username,
            presence: true,
            length: { minimum: 6 },
            uniqueness: { case_sensitive: false }
  validates :first_name, :last_name,
            presence: true,
            length: { in: 2..25 }

  def name
    first_name + ' ' + last_name
  end
end
