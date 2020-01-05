class User < ApplicationRecord
has_many :clients
has_many :infos
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def admin_level
    level = self.type
    return level
  end       
end
