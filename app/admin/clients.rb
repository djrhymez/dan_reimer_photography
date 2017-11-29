ActiveAdmin.register Client do
  permit_params :id, :address, :user_id

  form :html => { :enctype => "multipart/form-data" } do |f|
     f.inputs "Details" do
      f.input :address
      f.input :user_id, :as => :select, :collection => User.all.collect {|user| [user.id, user.id] }
      f.input :province, :as => :select, :collection => Province.all.collect {|province| [province.id, province.name] }
    end
    f.actions
   end
end
