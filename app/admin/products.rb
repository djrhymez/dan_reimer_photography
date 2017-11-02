ActiveAdmin.register Product do
permit_params :name, :description, :price,
              :stock_quantity, :product_text_tag_id, :category_id, :image

form :html => { :enctype => "multipart/form-data" } do |f|
   f.inputs "Details" do
    f.input :name
    f.input :description
    f.input :price
    f.input :stock_quantity
    f.input :category
    f.input :image, :as => :file
  end
  f.actions
 end

end
