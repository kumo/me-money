class PiggyBank < Account
  validates_numericality_of :goal_in_pence, :greater_than => 0, :allow_nil => true
  
  def amount_to_go_in_pence
    amount = self.goal_in_pence - self.balance_in_pence
    
    amount = 0 if amount < 0
    
    amount
  end
  
  def goal_reached?
    amount_to_go_in_pence == 0
  end
  
  def has_goal?
    self.goal_in_pence > 0 rescue false
  end
end
