class Worker < ApplicationRecord
  has_one :city
  has_one :profession
end