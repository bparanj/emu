class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(allowed_params)
    if @product.save
      redirect_to products_url, notice: 'Product was successfully created.'
    else
      render :new
    end
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(allowed_params)
      redirect_to products_url, notice: 'Product was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_url, notice: "Product was successfully destroyed."
  end
  
  def discontinue
    Product.where(id: params[:product_ids]).update_all(discontinued: true)
    
    redirect_to products_url
  end
  
  private
  
  def allowed_params
    params.require(:product).permit!
  end
end
