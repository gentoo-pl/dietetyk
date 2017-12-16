#
# Kontroler obsługujący zarządzanie Składnikami posiłku w panelu administracyjnym (Backendzie)
## Dziedziczymy po Backend::BaseController m.in. po to by zabezpieczyć dostęp hasłem
class Backend::SkladnikiController < Backend::BaseController

  # Wyszukanie składnika w bazie. Wyszukiwanie upakowane w metodę :set_element aby nie powtarzać kodu w każdej akcji
  before_action :set_skladnik, only: [:show, :edit, :update, :destroy]

  ##############################################################################
  # Lista wszystkich składników
  # @path /backend/skladniki
  #
  def index
    @skladniki = Skladnik.all
  end

  ##############################################################################
  # Wyświetlenie pojedynczego składnika
  # @path /backend/skladniki/1
  #
  def show
  end

  ##############################################################################
  # Wyświetlenie formularza do dodawania składniku
  # @path /backend/skladniki/new
  #
  def new
    @skladnik = Skladnik.new
  end

  ##############################################################################
  # Wyświetlenie formularza do edycji
  # @path /backend/skladniki/1/edit
  #
  def edit
  end

  ##############################################################################
  # Zapisanie składnika do bazy. Po kliknięciu przycisku "Dodaj składnik"
  def create
    @skladnik = Skladnik.new(skladnik_params)

    respond_to do |format|
      if @skladnik.save
        format.html { redirect_to backend_skladnik_path(@skladnik), notice: 'Skladnik został dodany' }
      else
        # coś poszło nie tak (może nie przeszło walidacji w modelu), formularz znowu się wyświetla z zaznaczonymi błędami
        format.html { render :new }
      end
    end
  end

  ##############################################################################
  # Zapisanie zmienionego składnika do bazy. Po kliknięciu przycisku "Zmień składnik"
  def update
    respond_to do |format|
      if @skladnik.update(skladnik_params)
        format.html { redirect_to [:backend, @skladnik], notice: 'Skladnik został zmieniony' }
      else
        # coś poszło nie tak (może nie przeszło walidacji w modelu), formularz znowu się wyświetla z zaznaczonymi błędami
        format.html { render :edit }
      end
    end
  end

  ##############################################################################
  # Usunięcie składnika
  #
  # @TODO jeśli składnik będzie już użyty w utworzeniu dania to nie może być usunięty !
  def destroy
    @skladnik.destroy
    respond_to do |format|
      format.html { redirect_to backend_skladniki_url, notice: 'Skladnik został usunięty' }
    end
  end


  ################################################################################
  # Poniżej znajdują się metody prywatne. Ze względu bezpieczeństwa nie można sie do nich
  # dostać bezpośrednio z poziomu wpisanego adresu w przegądarce
  # Wywoływane są tylko poprzez metody CRUD
  private
    # Wyszukanie składnika w bazie. Kod znajduje sie w poniższej akcji aby nie powtarzać go w akcjach :show, :edit, :update, :destroy
    def set_skladnik
      @skladnik = Skladnik.find(params[:id])
    end

    # Zabezpieczenie przed parametrami, których się nie spodziewamy. Odsiewamy tylko znane nam parametry
    def skladnik_params
      params.require(:skladnik).permit(:nazwa, :wartosc_energetyczna, :opis, :obrazek)
    end
end
