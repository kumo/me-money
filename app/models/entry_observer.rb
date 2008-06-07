class EntryObserver < ActiveRecord::Observer
  def after_create(entry)
    entry.account.update_attribute(:balance_in_pence, entry.account.balance_in_pence - entry.amount_in_pence)
  end
  
  def after_update(entry)
    if entry.amount_in_pence_changed?
      entry.account.update_attribute(:balance_in_pence, entry.account.balance_in_pence + entry.amount_in_pence_was - entry.amount_in_pence)
    end
  end
  
  def after_destroy(entry)
    entry.account.update_attribute(:balance_in_pence, entry.account.balance_in_pence + entry.amount_in_pence)
  end
end
