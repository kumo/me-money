class Entry < ActiveRecord::Base
  belongs_to :account

  validates_presence_of :description, :account
  validates_numericality_of :amount_in_pence, :only_integer => true
  
  before_save { |entry| entry.paid_on ||= Date.today }
end
