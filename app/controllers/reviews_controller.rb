class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :set_reviews, only: [:show, :edit, :update, :destroy]

  # GET /reviews
  # GET /reviews.json
  def index
    @reviews = Review.all
    @restaurant = Restaurant.all
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
  end

  # GET /reviews/new
  def new
    @review = Review.new
  end

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @review = Review.new(review_params)
    rp = review_params
    res_name = rp[:restaurant_id]
    res = Restaurant.where(:name => res_name)
    res.each {|r| @review.restaurant_id = r.id.to_i}
    
    respond_to do |format|
      if @review.save
        format.html { redirect_to reviews_url, notice: 'Review was successfully created.' }
        format.json { render :action => 'index', status: :created, location: @review }
      else
        format.html { render :new }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    rp = review_params
    res_name = rp[:restaurant_id]
    res = Restaurant.where(:name => res_name)
    res.each {|r| @restaurant_id = r.id.to_i}
    rp[:restaurant_id] = @restaurant_id
    
    respond_to do |format|
      if @review.update(rp)
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to reviews_url, notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end
    
    def set_reviews
      @reviews = Review.all
    end
    
    

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:author, :body, :rating, :restaurant_id)
    end
end
