require 'httparty'
require 'json'

class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all

    response = HTTParty.get("http://testyourmath.azurewebsites.net/api/alllogs")
    @mathacersusers = response


    base_uri = 'https://api.parse.com/1/classes/Question1'
    
    response = 
      HTTParty.get(base_uri,  
        :headers => 
            { "X-Parse-Application-Id" => "0oPOYcdV0OWRoR9Rh8ypAHIJmMMo6p8IE1nB02LW", 
              "X-Parse-REST-API-Key" => "QmhvafF4Jpd6D64UklxcY36v9JUaS6VvrmOKYwOW" 
            },

        :query => {"where" => '{"Set":"4","IsMedley":true, "Topic":"number sense" }' }

            )

    @testvar = response["results"][0]["QuestionText"]
    #@testvar = JSON.parse(open("https://api.box.com/2.0/users/me?access_token=#{token}").read)
  end

  # GET /products/1
  # GET /products/1.json
  def show

  end

  def map
    
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render action: 'show', status: :created, location: @product }
      else
        format.html { render action: 'new' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:title, :description, :image_url, :price)
    end
end
