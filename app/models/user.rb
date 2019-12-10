class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :comments, dependent: :destroy
  has_many :jokes, dependent: :destroy
  has_many :favourites, dependent: :destroy

  validates :username, presence: true
  validates :username, uniqueness: true
end
