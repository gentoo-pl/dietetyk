class Frontend::WelcomesController < Frontend::BaseController

  def home
    @polecane_dania = Danie.where(polecane: true)
  end
end
