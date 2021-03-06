class Gif < ApplicationRecord
  self.per_page = 3
  acts_as_taggable_on :tags

  belongs_to :user
  has_one_attached :file

  validates :file, attached: true, size: { less_than: 5.megabytes , message: 'file should be less than 1mb' }, content_type: ["image/png"]
end
