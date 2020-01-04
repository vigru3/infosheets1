class Section < ApplicationRecord
  belongs_to :client
  belongs_to :user
  has_many :infos
end
