class Account < ActiveRecord::Base
  has_many :entries
  
  validates_presence_of :name
end
