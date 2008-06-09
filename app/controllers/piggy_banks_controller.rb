class PiggyBanksController < ApplicationController
  # GET /piggy_banks
  # GET /piggy_banks.xml
  def index
    @piggy_banks = PiggyBank.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @piggy_banks }
    end
  end

  # GET /piggy_banks/1
  # GET /piggy_banks/1.xml
  def show
    @piggy_bank = PiggyBank.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @piggy_bank }
    end
  end

  # GET /piggy_banks/new
  # GET /piggy_banks/new.xml
  def new
    @piggy_bank = PiggyBank.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @piggy_bank }
    end
  end

  # GET /piggy_banks/1/edit
  def edit
    @piggy_bank = PiggyBank.find(params[:id])
  end

  # POST /piggy_banks
  # POST /piggy_banks.xml
  def create
    @piggy_bank = PiggyBank.new(params[:piggy_bank])

    respond_to do |format|
      if @piggy_bank.save
        flash[:notice] = 'PiggyBank was successfully created.'
        format.html { redirect_to(@piggy_bank) }
        format.xml  { render :xml => @piggy_bank, :status => :created, :location => @piggy_bank }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @piggy_bank.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /piggy_banks/1
  # PUT /piggy_banks/1.xml
  def update
    @piggy_bank = PiggyBank.find(params[:id])

    respond_to do |format|
      if @piggy_bank.update_attributes(params[:piggy_bank])
        flash[:notice] = 'PiggyBank was successfully updated.'
        format.html { redirect_to(@piggy_bank) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @piggy_bank.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /piggy_banks/1
  # DELETE /piggy_banks/1.xml
  def destroy
    @piggy_bank = PiggyBank.find(params[:id])
    @piggy_bank.destroy

    respond_to do |format|
      format.html { redirect_to(piggy_banks_url) }
      format.xml  { head :ok }
    end
  end
end
