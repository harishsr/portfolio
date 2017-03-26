class Entry < ApplicationRecord

  CONTENT_LENGTH_MAX = 40_000

  belongs_to :admin

  validates :title, presence: true,
    length: { in: 3..200 }
  validates :content, presence: true,
    length: { in: 3..CONTENT_LENGTH_MAX }

end
