class Client < ApplicationRecord
  has_many :sections
  belongs_to :user
end
