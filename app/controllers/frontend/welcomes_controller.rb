class Frontend::WelcomesController < Frontend::BaseController

  def home
    @polecane_dania = Danie.polecane.aktywne
    @dania          = Danie.aktywne
    @kategorie      = Kategoria.aktywna
  end
end
