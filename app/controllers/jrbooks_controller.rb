class JrbooksController < ApplicationController
  before_action :set_jrbook, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]
  # GET /jrbooks or /jrbooks.json
  def index
    @pagy, @jrbooks = pagy(Jrbook.all)
  end

  # GET /jrbooks/1 or /jrbooks/1.json
  def show
  end

  # GET /jrbooks/new
  def new
    #@jrbook = Jrbook.new
    @jrbook = current_user.jrbooks.build
  end

  # GET /jrbooks/1/edit
  def edit
  end

  # POST /jrbooks or /jrbooks.json
  def create
    #@jrbook = Jrbook.new(jrbook_params)
    @jrbook = current_user.jrbooks.build(jrbook_params)

    respond_to do |format|
      if @jrbook.save
        format.html { redirect_to jrbook_url(@jrbook), notice: "Book was successfully created." }
        format.json { render :show, status: :created, location: @jrbook }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @jrbook.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jrbooks/1 or /jrbooks/1.json
  def update
    respond_to do |format|
      if @jrbook.update(jrbook_params)
        format.html { redirect_to jrbook_url(@jrbook), notice: "Book was successfully updated." }
        format.json { render :show, status: :ok, location: @jrbook }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @jrbook.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jrbooks/1 or /jrbooks/1.json
  def destroy
    @jrbook.destroy

    respond_to do |format|
      format.html { redirect_to jrbooks_url, notice: "Book was successfully deleted." }
      format.json { head :no_content }
    end
  end

  def correct_user
    @jrbook = current_user.jrbooks.find_by(id: params[:id])
    redirect_to jrbooks_path, notice: "Not Authorized To Edit This Book" if @jrbook.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_jrbook
      @jrbook = Jrbook.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def jrbook_params
      params.require(:jrbook).permit(:name, :author, :read, :book_rating, :user_id)
    end
end
