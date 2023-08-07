class Micropost < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  # set the default order in which elements are retrieved from the database
  default_scope -> { order(created_at: :desc) } # descending
  validates :user_id, presence: true
  validates :content, presence: true, length: {maximum: 140}
  validates :image, content_type: { in: %w[image/jpeg image/png image/gif], 
                                   message: "Must be a valid image format"},
                    size: { less_than: 5.megabytes,
                           message: "Should be less than 5 MB" }
  def display_image
    image.variant(resize_to_limit: [500, 500])
  end

end