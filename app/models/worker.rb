class Worker < ActiveRecord::Base
  has_one :city
  has_one :profession
end