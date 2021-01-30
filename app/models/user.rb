class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
   # has_many :students, dependent: :destroy
   # has_many :institutions, dependent: :destroy

   validates_presence_of :name, :email, :password, :password_confirmation, :phone_number
   validates :phone_number, numericality: { only_integer: true }
   validates :password, :password_confirmation, length: { in: 6..20 }
   validates :phone_number, length: { is: 10 }
   validates :email, :uniqueness => true
   validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
end
