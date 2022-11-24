class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  with_options presence: true do
    validates :user_id
    validates :image
    validates :name
    validates :item_content
    validates :category_id
    validates :condition_id
    validates :cost_id
    validates :sender_area_id
    validates :delivery_time_id
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
