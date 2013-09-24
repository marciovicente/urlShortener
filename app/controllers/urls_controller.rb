class UrlsController < ApplicationController
  # GET /urls
  # GET /urls.json
  def index
    #@urls = Url.all
    @url = Url.new
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @urls }
    end
  end

  # GET /urls/1
  # GET /urls/1.json
  #def show
  #   @url = Url.find(params[:id])

  #   respond_to do |format|
  #     format.html # show.html.erb
  #     format.json { render json: @url }
  #   end
  # end

  # GET /urls/new
  # GET /urls/new.json
  def new
    @url = Url.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @url }
    end
  end

  # GET /urls/1/edit
  # def edit
  #   @url = Url.find(params[:id])
  # end

  # POST /urls
  # POST /urls.json
  def create
    @url = Url.new(params[:url])

    respond_to do |format|
      if @url.save
        format.html {  }#redirect_to @url, notice: 'Url was successfully created.'
        format.json { render json: @url, status: :created, location: @url }
      else
        format.html { render action: "new" }
        format.json { render json: @url.errors, status: :unprocessable_entity }
      end
    end
  end

  def error_method

  end

  def find
    @alias = params[:alias]
    @url = Url.where(:alias => @alias).first

    respond_to do |format|
      format.html { redirect_to @url.url }
    end
  end
end
