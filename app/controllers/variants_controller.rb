class VariantsController < ApplicationController

  def import
    Variant.my_import(params[:file])
    redirect_to  import_home_index_path
  end

end
