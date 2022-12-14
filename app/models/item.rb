class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_one :order
  with_options presence: true do
    validates :image
    validates :name
    validates :item_content
    validates :category_id
    validates :condition_id
    validates :cost_id
    validates :sender_area_id
    validates :delivery_time_id
    validates :price, numericality: { only_intejer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end
  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :condition_id
    validates :cost_id
    validates :sender_area_id
    validates :delivery_time_id
  end
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :cost
  belongs_to :sender_area
  belongs_to :delivery_time
end
