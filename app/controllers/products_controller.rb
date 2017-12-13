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
   @all_categories = Category.all
   @categories = find_categories
  end

  def update
    respond_to do |format|
      if @product.update_attributes(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product.destroy

    redirect_to products_path, notice: "El producto fue eliminado con éxito"
  end

  private
    def product_params
       params.require(:product).permit(:name, :price, {category_ids: []})
    end

    def category_params
      params.require(:category_ids)
    end

    def find_product
			@product = Product.find(params[:id])
		end

    def find_categories
      @product.categories
    end

end
