class RoclientsController < ApplicationController
  before_filter :require_user
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
end
