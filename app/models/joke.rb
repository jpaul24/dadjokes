class Joke < ApplicationRecord
  validates :joke, presence: true, uniqueness: true

  has_many :comments, dependent: :destroy
  belongs_to :user
end
