class Section < ApplicationRecord
  belongs_to :client
  has_many :infos
end
