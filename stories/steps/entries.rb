steps_for :entries do
  When "I change the entry description to '$name'" do |name|
    put_via_redirect "/accounts/#{@account.id}/entries/#{@entry.id}", :entry => {:description => name }
  end

  When "I change the entry amount to $amount euros" do |amount|
    put_via_redirect "/accounts/#{@account.id}/entries/#{@entry.id}", :entry => {:amount_in_pence => amount.to_i}
  end
  
  When "I delete the entry" do
    delete_via_redirect "/accounts/#{@account.id}/entries/#{@entry.id}"
  end
  
  Then "I should see the entry" do
    response.should render_template("entries/show")
  end
  
  Then "the entry amount should now be $amount euros" do |amount|
    lambda {
      @entry.reload
    }.should change(@entry, :amount_in_pence).to(amount.to_i)
  end

  Then "the entry amount should still be $amount euros" do |amount|
    @entry.reload
    @entry.amount_in_pence.should == amount.to_i
  end

  Then "the entry should now be called '$description'" do |description|
    lambda {
      @entry.reload
    }.should change(@entry, :description).to(description)
  end

  Then "the entry should still be called '$description'" do |description|
    @entry.reload
    @entry.description.should === description
  end

  Then "I should see the list of entries" do
    response.should render_template("entries/index")
  end
end