class ProductsController < ApplicationController
  before_action :find_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
    @categories = Category.all
  end

  def create
    @product = Product.new(product_params)
    @product.categories = category_params
    if @product.save
      redirect_to products_path, notice: 'El producto fue publicado exitosamente'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @product.update(product_params)
       #@product.categories.update(category_params)
      redirect_to products_path, notice: "El producto ha sido modificado con éxito"
    else
      render :edit
    end
  end

  def destroy
    product.destroy

    redirect_to products_path, notice: "El producto fue eliminado con éxito"
  end

  private
    def product_params
      #params.require(:product).permit(:name, :price, category_ids: [])
      params.require(:product).permit(:name, :price)
    end

    def category_params
      params.require(:category_ids)
    end

    def find_product
			@product = Product.find(params[:id])
		end

end
