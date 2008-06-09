require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PiggyBanksController do
  describe "route generation" do

    it "should map { :controller => 'piggy_banks', :action => 'index' } to /piggy_banks" do
      route_for(:controller => "piggy_banks", :action => "index").should == "/piggy_banks"
    end
  
    it "should map { :controller => 'piggy_banks', :action => 'new' } to /piggy_banks/new" do
      route_for(:controller => "piggy_banks", :action => "new").should == "/piggy_banks/new"
    end
  
    it "should map { :controller => 'piggy_banks', :action => 'show', :id => 1 } to /piggy_banks/1" do
      route_for(:controller => "piggy_banks", :action => "show", :id => 1).should == "/piggy_banks/1"
    end
  
    it "should map { :controller => 'piggy_banks', :action => 'edit', :id => 1 } to /piggy_banks/1/edit" do
      route_for(:controller => "piggy_banks", :action => "edit", :id => 1).should == "/piggy_banks/1/edit"
    end
  
    it "should map { :controller => 'piggy_banks', :action => 'update', :id => 1} to /piggy_banks/1" do
      route_for(:controller => "piggy_banks", :action => "update", :id => 1).should == "/piggy_banks/1"
    end
  
    it "should map { :controller => 'piggy_banks', :action => 'destroy', :id => 1} to /piggy_banks/1" do
      route_for(:controller => "piggy_banks", :action => "destroy", :id => 1).should == "/piggy_banks/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'piggy_banks', action => 'index' } from GET /piggy_banks" do
      params_from(:get, "/piggy_banks").should == {:controller => "piggy_banks", :action => "index"}
    end
  
    it "should generate params { :controller => 'piggy_banks', action => 'new' } from GET /piggy_banks/new" do
      params_from(:get, "/piggy_banks/new").should == {:controller => "piggy_banks", :action => "new"}
    end
  
    it "should generate params { :controller => 'piggy_banks', action => 'create' } from POST /piggy_banks" do
      params_from(:post, "/piggy_banks").should == {:controller => "piggy_banks", :action => "create"}
    end
  
    it "should generate params { :controller => 'piggy_banks', action => 'show', id => '1' } from GET /piggy_banks/1" do
      params_from(:get, "/piggy_banks/1").should == {:controller => "piggy_banks", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'piggy_banks', action => 'edit', id => '1' } from GET /piggy_banks/1;edit" do
      params_from(:get, "/piggy_banks/1/edit").should == {:controller => "piggy_banks", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'piggy_banks', action => 'update', id => '1' } from PUT /piggy_banks/1" do
      params_from(:put, "/piggy_banks/1").should == {:controller => "piggy_banks", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'piggy_banks', action => 'destroy', id => '1' } from DELETE /piggy_banks/1" do
      params_from(:delete, "/piggy_banks/1").should == {:controller => "piggy_banks", :action => "destroy", :id => "1"}
    end
  end
end
