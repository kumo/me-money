require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/piggy_banks/edit.html.erb" do
  include PiggyBanksHelper
  
  before do
    @piggy_bank = mock_model(PiggyBank)
    @piggy_bank.stub!(:name).and_return("MyString")
    @piggy_bank.stub!(:balance_in_pence).and_return("1")
    @piggy_bank.stub!(:goal_in_pence).and_return("1")
    @piggy_bank.stub!(:due_on).and_return(Date.today)
    assigns[:piggy_bank] = @piggy_bank
  end

  it "should render edit form" do
    render "/piggy_banks/edit.html.erb"
    
    response.should have_tag("form[action=#{piggy_bank_path(@piggy_bank)}][method=post]") do
      with_tag('input#piggy_bank_name[name=?]', "piggy_bank[name]")
      with_tag('input#piggy_bank_balance_in_pence[name=?]', "piggy_bank[balance_in_pence]")
      with_tag('input#piggy_bank_goal_in_pence[name=?]', "piggy_bank[goal_in_pence]")
    end
  end
end


