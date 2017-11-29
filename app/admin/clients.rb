ActiveAdmin.register Client do
  permit_params :id, :address, :user_id

  form :html => { :enctype => "multipart/form-data" } do |f|
     f.inputs "Details" do
      f.input :address
      f.input :user_id, :as => :select, :collection => User.all.collect {|user| [user.id, user.id] }
    end
    f.actions
   end
end
