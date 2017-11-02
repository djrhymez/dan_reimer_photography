ActiveAdmin.register Product do
permit_params :name, :description, :price,
              :stock_quantity, :product_text_tag_id, :category_id

end
