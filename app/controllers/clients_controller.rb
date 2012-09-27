class ClientsController < ApplicationController

  before_filter :require_user
  before_filter :verify_admin
  # GET /clients
  # GET /clients.json
  def index
    if params[:date]
      @year = params[:date][:year]
      @month = params[:date][:month]
      @time = Time.new(@year,@month)
      @date = @time.to_date
      if @date.year == 2030
        @future = true
      end
      else
      @date = Date.today - 1.month
      @time = @date.to_time
    end
    @clients = Client.order( "name asc").all
    @links = @clients.map { |client| client.create_link(@time) }
    #@links = client.create_link(Time.new(2012,07))


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @clients }
    end

    params.delete(:date)
  end

  # GET /clients/1
  # GET /clients/1.json
  def show
    @client = Client.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @client }
    end
  end

  # GET /clients/new
  # GET /clients/new.json
  def new
    @client = Client.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @client }
    end
  end

  # GET /clients/1/edit
  def edit
    @client = Client.find(params[:id])
  end

  # POST /clients
  # POST /clients.json
  def create
    @client = Client.new(params[:client])

    respond_to do |format|
      if @client.save
        format.html { redirect_to @client, notice: 'Client was successfully created.' }
        format.json { render json: @client, status: :created, location: @client }
      else
        format.html { render action: "new" }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /clients/1
  # PUT /clients/1.json
  def update
    @client = Client.find(params[:id])

    respond_to do |format|
      if @client.update_attributes(params[:client])
        format.html { redirect_to @client, notice: 'Client was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.json
  def destroy
    @client = Client.find(params[:id])
    @client.destroy

    respond_to do |format|
      format.html { redirect_to clients_url }
      format.json { head :ok }
    end
  end
end
