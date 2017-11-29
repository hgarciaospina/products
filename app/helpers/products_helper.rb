module ProductsHelper
  def form_title
    @product.new_record? ? "Nuevo Producto" : "Editar Producto"
  end

end
