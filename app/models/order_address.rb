class OrderAddress
  include ActiveModel::model
  after_accessor :post_code, :sender_area_id, :city, :address, :building_name, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :sender_area_id
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A[0-9]{11}\z/}
  end  
end  