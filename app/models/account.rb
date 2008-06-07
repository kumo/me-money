class Account < ActiveRecord::Base
  has_many :entries, :dependent => :destroy
  
  validates_presence_of :name
  
  before_save { |account| account.balance_in_pence ||= 0 }
end
