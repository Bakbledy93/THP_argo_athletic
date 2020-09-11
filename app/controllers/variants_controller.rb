class VariantsController < ApplicationController

  def import
    Variant.my_import(params[:file])
    redirect_to  import_admins_path
  end

end
