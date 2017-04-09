class Entry < ApplicationRecord

  CONTENT_LENGTH_MAX = 40_000

  belongs_to :admin
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  validates :title, presence: true,
    length: { in: 3..200 }
  validates :content, presence: true,
    length: { in: 3..CONTENT_LENGTH_MAX }

end
