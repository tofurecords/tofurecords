class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable;

         has_many :requests
         has_many :carts
         has_many :favorites
         has_many :boughts
         has_many :ships
end
