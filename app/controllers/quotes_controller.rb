class QuotesController < ApplicationController
  before_action :set_quote, only: [:show, :edit, :update, :destroy]

  # GET /quotes
  def index
    @quotes = Quote.all.order('created_at DESC')
    @quote = Quote.new
  end

  # GET /quotes/1
  def show; end

  # GET /quotes/new
  def new
    @quote = current_user.quotes.build
  end

  # GET /quotes/1/edit
  def edit; end

  # POST /quotes
    def create
      @quote = current_user.quotes.build(quote_params)
  
      respond_to do |format|
        if @quote.save
          format.html { redirect_to root_path, notice: 'Quote was successfully created.' }
        else
          format.html { render :new }
        end
      end
    end
  
    def update
      respond_to do |format|
        if @quote.update(quote_params)
          format.html { redirect_to @quote, notice: 'Quote was successfully updated.' }
        else
          format.html { render :edit }
        end
      end
    end

    def destroy
      @quote.destroy
      respond_to do |format|
        format.html { redirect_to quotes_url, notice: 'Quote was successfully destroyed.' }
      end
    end
  
    private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_quote
      @quote = Quote.find(params[:id])
    end
  
    # Only allow a list of trusted parameters through.
    def quote_params
      params.require(:quote).permit(:quote)
    end
end
