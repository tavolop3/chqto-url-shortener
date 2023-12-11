class LinksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_link, only: %i[show edit update destroy stats list]
  before_action :set_accesses, only: %i[stats list]

  # GET /links or /links.json
  def index
    @links = current_user.links.paginate(page: params[:page], per_page: 4)
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
        format.html { redirect_to link_url(@link), notice: 'El link fue creado exitosamente.' }
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
        format.html { redirect_to link_url(@link), notice: 'El link fue editado correctamente.' }
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
      format.html { redirect_to links_url, notice: 'El link fue eliminado exitosamente' }
      format.json { head :no_content }
    end
  end

  def stats; end

  def list
    @accesses = @accesses.where('ip_address LIKE ?', "%#{params[:ip_address]}%") if params[:ip_address].present?
    if params[:start_date].present? && params[:end_date].present?
      end_date = params[:end_date].to_datetime.end_of_day
      @accesses = @accesses.where(created_at: params[:start_date]..end_date)
    end
    @matches = @accesses.count
    render('stats')
  end

  private

  def set_link
    @link = current_user.links.find(params[:id])
  end

  def link_params
    params.require(:link).permit(:url, :name, :type, :expiration_date, :password)
  end

  def set_accesses
    @accesses = @link.accesses.order(created_at: :desc).paginate(page: params[:page], per_page: 10)
    @accesses_by_day = @link.accesses.group('DATE(created_at)').count
  end
end
