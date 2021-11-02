class Gif < ApplicationRecord
  belongs_to :user
  has_one_attached :file

  validates :file, attached: true, size: { less_than: 1.megabytes , message: 'file should be less than 1mb' }
end
