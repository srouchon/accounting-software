class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable    
  has_many :companies, through: :user_companies
  validates :firstname, presence :true
  validates :lastname, presence :true
end
