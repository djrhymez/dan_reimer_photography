ActiveAdmin.register Client do
  permit_params :name, :email, :password
end
