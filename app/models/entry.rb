class Entry < ApplicationRecord

  CONTENT_LENGTH_MAX = 40_000
  IMAGE_SIZE_MAX = 5.megabytes

  belongs_to :admin

  has_attached_file :image, 
    styles: { medium: "800x500>" }, 
    default_url: "/images/:style/missing.png"
  validates_attachment :image,
    content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] },
    size: { in: 0..IMAGE_SIZE_MAX }

  validates :title, presence: true,
    length: { in: 3..200 }
  validates :content, presence: true,
    length: { in: 3..CONTENT_LENGTH_MAX }

  default_scope ->{ order(created_at: :desc) }

  def author
    admin ? admin.name : "Anonymous"
  end
end
