class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_number, :prefecture_id, :city, :house_number, :building_name, :phone_number, :user_id, :item_id, :token

end