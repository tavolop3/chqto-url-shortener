class LinksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_link, only: %i[show edit update destroy stats]

  # GET /links or /links.json
  def index
    @links = current_user.links
  end

  # GET /links/1 or /links/1.json
  def show; end

  # GET /links/new
  def new
    @link = Link.new
  end

  # GET /links/1/edit
  def edit; end

  # POST /links or /links.json
  def create
    @link = Link.new(link_params)
    @link.user = current_user
    respond_to do |format|
      if @link.save
        format.html { redirect_to link_url(@link), notice: 'Link was successfully created.' }
        format.json { render :show, status: :created, location: @link }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /links/1 or /links/1.json
  def update
    respond_to do |format|
      if @link.update(link_params)
        format.html { redirect_to link_url(@link), notice: 'Link was successfully updated.' }
        format.json { render :show, status: :ok, location: @link }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /links/1 or /links/1.json
  def destroy
    @link.destroy!

    respond_to do |format|
      format.html { redirect_to links_url, notice: 'Link was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def stats
    @accesses = @link.accesses.order(created_at: :desc)
    @accesses_by_day = @link.accesses.group('DATE(created_at)').count
  end

  private

  def set_link
    @link = current_user.links.find(params[:id])
  end

  def link_params
    params.require(:link).permit(:url, :name, :type, :expiration_date, :password)
  end
end
