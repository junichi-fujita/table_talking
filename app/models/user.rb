class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,:recoverable, :rememberable, :validatable
  
  has_many :participant_managements, dependent: :destroy
  has_many :recruitments, through: :participant_managements
  has_many :characters, dependent: :destroy

  validates :email, presence: true, "valid_email_2/email": true, uniqueness: true
  validates :name, presence: true, length: { maximum: 30 }
end
