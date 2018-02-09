class Backend::WelcomesController < Backend::BaseController

  def home
    @ilosc_dan = Danie.count
    @ilosc_kategorii = Kategoria.count
    @ilosc_skladnikow = Skladnik.count
  end
end
