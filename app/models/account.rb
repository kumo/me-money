class Account < ActiveRecord::Base
  has_many :entries, :dependent => :destroy
  
  validates_presence_of :name
end
