class DropCouponsTable < ActiveRecord::Migration
  def change
  	drop_table :coupons
  end
end
