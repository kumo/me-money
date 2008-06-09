require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PiggyBank do
  before(:each) do
    @piggy_bank = PiggyBank.new
  end

  it "should be valid" do
    @piggy_bank.name = "PiggyBankName"
    @piggy_bank.should be_valid
  end
  
  it "should be invalid without a name" do
    @piggy_bank.name = ''
    @piggy_bank.should_not be_valid
    @piggy_bank.should have(1).error_on(:name)
  end
  
  it "should be invalid with a negative goal" do
    @piggy_bank.goal_in_pence = -50
    @piggy_bank.should_not be_valid
    @piggy_bank.should have(1).error_on(:goal_in_pence)
  end
end

describe PiggyBank, "when creating" do
  before(:each) do
    @piggy_bank = PiggyBank.new(:name => "New piggy_bank")
  end
  
  it "should assign an empty balance if not specified" do
    @piggy_bank.balance_in_pence = nil
    lambda {
      @piggy_bank.save
    }.should change(@piggy_bank, :balance_in_pence).to(0)
  end
  
  it "should not assign a default balance if it has already been specified" do
    @piggy_bank.balance_in_pence = 35
    lambda {
      @piggy_bank.save
    }.should_not change(@piggy_bank, :balance_in_pence)
  end
end

describe PiggyBank, "when calculating amount to go" do
  before(:each) do
    @piggy_bank = PiggyBank.new
    @piggy_bank.balance_in_pence = 150
    @piggy_bank.goal_in_pence = 300
  end
  
  it "should be 0 if goal reached" do
    @piggy_bank.balance_in_pence = 300
    @piggy_bank.goal_in_pence = 300
    
    @piggy_bank.amount_to_go_in_pence.should == 0
  end

  it "should be 0 if goal passed" do
    @piggy_bank.balance_in_pence = 350
    @piggy_bank.goal_in_pence = 300
    
    @piggy_bank.amount_to_go_in_pence.should == 0
  end
  
  it "should calculate negative balance" do
    @piggy_bank.balance_in_pence = -50
    @piggy_bank.goal_in_pence = 100
    
    @piggy_bank.amount_to_go_in_pence.should == 150
  end

  it "should calculate amount to go" do
    @piggy_bank.balance_in_pence = 50
    @piggy_bank.goal_in_pence = 150
    
    @piggy_bank.amount_to_go_in_pence.should == 100
  end
end

describe PiggyBank, "when calculating if goal has been reached" do
  before(:each) do
    @piggy_bank = PiggyBank.new
    @piggy_bank.balance_in_pence = 150
    @piggy_bank.goal_in_pence = 300
  end
  
  it "should be true if goal and balance are the same" do
    @piggy_bank.balance_in_pence = 300
    @piggy_bank.goal_in_pence = 300
    
    @piggy_bank.goal_reached?.should == true
  end

  it "should be true if goal has been passed" do
    @piggy_bank.balance_in_pence = 350
    @piggy_bank.goal_in_pence = 300
    
    @piggy_bank.goal_reached?.should == true
  end
  
  it "should be false if more money is needed" do
    @piggy_bank.balance_in_pence = -50
    @piggy_bank.goal_in_pence = 100
    
    @piggy_bank.goal_reached?.should == false
  end
  
  it "should have a goal if amount is set" do
    @piggy_bank.goal_in_pence = 100
    @piggy_bank.has_goal?.should == true
  end
  
  it "should not have a goal if amount not set" do
    @piggy_bank.goal_in_pence = 0
    @piggy_bank.has_goal?.should == false

    @piggy_bank.goal_in_pence = nil
    @piggy_bank.has_goal?.should == false
  end
end

describe PiggyBank, "when calculating days left" do
  before(:each) do
    @piggy_bank = PiggyBank.new
  end
  
  it "should be 0 if today" do
    @piggy_bank.due_on = Date.today
    @piggy_bank.days_to_go.should == 0
  end

  it "should be 1 if tomorrow" do
    @piggy_bank.due_on = Date.today + 1.days
    @piggy_bank.days_to_go.should == 1
  end


  it "should be 7 if next week" do
    @piggy_bank.due_on = Date.today + 1.week
    @piggy_bank.days_to_go.should == 7
  end
  
  it "should be 0 if in the past" do
    @piggy_bank.due_on = Date.today - 3.days
    @piggy_bank.days_to_go.should == 0
  end
end