class Info < ApplicationRecord
  belongs_to :section

  has_rich_text :infodata
end
