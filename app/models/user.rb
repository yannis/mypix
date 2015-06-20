class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :pics, inverse_of: :user, dependent: :destroy

  validates_presence_of :name
end
