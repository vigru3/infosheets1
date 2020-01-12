class User < ApplicationRecord
has_many :clients
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def user_type
    level = self.type
    return level
  end
  
  
end
