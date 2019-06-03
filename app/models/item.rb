class Item < ActiveRecord::Base
  belongs_to :potluck
  belongs_to :user
end
