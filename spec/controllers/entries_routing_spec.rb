require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe EntriesController do
  describe "route generation" do

    it "should map { :controller => 'entries', :action => 'index', :account_id => 1 } to /accounts/1/entries" do
      route_for(:controller => "entries", :action => "index", :account_id => 1).should == "/accounts/1/entries"
    end
  
    it "should map { :controller => 'entries', :action => 'new', :account_id => 1 } to /accounts/1/entries/new" do
      route_for(:controller => "entries", :action => "new", :account_id => 1).should == "/accounts/1/entries/new"
    end
  
    it "should map { :controller => 'entries', :action => 'show', :id => 1, :account_id => 1 } to /accounts/1/entries/1" do
      route_for(:controller => "entries", :action => "show", :id => 1, :account_id => 1).should == "/accounts/1/entries/1"
    end
  
    it "should map { :controller => 'entries', :action => 'edit', :id => 1, :account_id => 1 } to /accounts/1/entries/1/edit" do
      route_for(:controller => "entries", :action => "edit", :id => 1, :account_id => 1).should == "/accounts/1/entries/1/edit"
    end
  
    it "should map { :controller => 'entries', :action => 'update', :id => 1, :account_id => 1 } to /accounts/1/entries/1" do
      route_for(:controller => "entries", :action => "update", :id => 1, :account_id => 1).should == "/accounts/1/entries/1"
    end
  
    it "should map { :controller => 'entries', :action => 'destroy', :id => 1, :account_id => 1 } to /accounts/1/entries/1" do
      route_for(:controller => "entries", :action => "destroy", :id => 1, :account_id => 1).should == "/accounts/1/entries/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'entries', action => 'index', :account_id => '1' } from GET /accounts/1/entries" do
      params_from(:get, "/accounts/1/entries").should == {:controller => "entries", :action => "index", :account_id => "1"}
    end
  
    it "should generate params { :controller => 'entries', action => 'new', :account_id => '1' } from GET /accounts/1/entries/new" do
      params_from(:get, "/accounts/1/entries/new").should == {:controller => "entries", :action => "new", :account_id => "1"}
    end
  
    it "should generate params { :controller => 'entries', action => 'create', :account_id => '1' } from POST /accounts/1/entries" do
      params_from(:post, "/accounts/1/entries").should == {:controller => "entries", :action => "create", :account_id => "1"}
    end
  
    it "should generate params { :controller => 'entries', action => 'show', id => '1', :account_id => '1' } from GET /accounts/1/entries/1" do
      params_from(:get, "/accounts/1/entries/1").should == {:controller => "entries", :action => "show", :id => "1", :account_id => "1"}
    end
  
    it "should generate params { :controller => 'entries', action => 'edit', id => '1', :account_id => '1' } from GET /accounts/1/entries/1/edit" do
      params_from(:get, "/accounts/1/entries/1/edit").should == {:controller => "entries", :action => "edit", :id => "1", :account_id => "1"}
    end
  
    it "should generate params { :controller => 'entries', action => 'update', id => '1', :account_id => '1' } from PUT /accounts/1/entries/1" do
      params_from(:put, "/accounts/1/entries/1").should == {:controller => "entries", :action => "update", :id => "1", :account_id => "1"}
    end
  
    it "should generate params { :controller => 'entries', action => 'destroy', id => '1', :account_id => '1' } from DELETE /accounts/1/entries/1" do
      params_from(:delete, "/accounts/1/entries/1").should == {:controller => "entries", :action => "destroy", :id => "1", :account_id => "1"}
    end
  end
end
