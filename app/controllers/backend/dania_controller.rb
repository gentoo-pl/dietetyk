#
# Kontroler obsługujący zarządzanie Daniami w panelu administracyjnym (Backendzie)
## Dziedziczymy po Backend::BaseController m.in. po to by zabezpieczyć dostęp hasłem
class Backend::DaniaController < Backend::BaseController
  # Wyszukanie składnika w bazie danych i zapisanie do zmiennej @skladnik.
  # Wyszukiwanie upakowane w metodę :set_danie aby nie powtarzać kodu w każdej akcji
  before_action :set_danie, only: [:show, :edit, :update, :destroy]

  # pobranie wszystkich składników z bazy i zapisanie do zmiennej @skladniki
  before_action :set_skladniki, only: [:new, :edit, :update, :create]

  ##############################################################################
  # Lista wszystkich dań
  # @path /backend/dania
  #
  def index
    # @TODO - wyjaśnić czym się różni zmienna z małpą i bez małpy
    @dania = Danie.all
  end

  ##############################################################################
  # Wyświetlenie pojedynczego dania
  # @path /backend/dania/1
  #
  def show
  end

  ##############################################################################
  # Wyświetlenie formularza do dodawania dań
  # @path /backend/dania/new
  #
  # @TODO - Jeśli nie ma żadnego składniku, niech przekieruje do formularza dodawania
  # pierwszego składniku
  #
  def new
    @danie = Danie.new
  end

  ##############################################################################
  # Wyświetlenie formularza do edycji
  # @path /backend/dania/1/edit
  #
  def edit
  end

  ##############################################################################
  # Zapisanie dania do bazy danych. Po kliknięciu przycisku "Dodaj danie"
  def create
    @danie = Danie.new(danie_params)

    respond_to do |format|
      if @danie.save
        format.html { redirect_to [:backend, @danie], notice: 'Danie zostało dodane' }
      else
        # coś poszło nie tak (może nie przeszło walidacji w modelu), formularz znowu się wyświetla z zaznaczonymi błędami
        format.html { render :new }
      end
    end
  end

  ##############################################################################
  # Zapisanie zmienionego dania do bazy. Po kliknięciu przycisku "Zmień danie"
  def update
    respond_to do |format|
      if @danie.update(danie_params)
        format.html { redirect_to [:backend, @danie], notice: 'Danie zostało zmienione' }
      else
        # coś poszło nie tak (może nie przeszło walidacji w modelu), formularz znowu się wyświetla z zaznaczonymi błędami
        format.html { render :edit }
      end
    end
  end

  ##############################################################################
  # Usunięcie dania
  #
  def destroy
    @danie.destroy
    respond_to do |format|
      format.html { redirect_to backend_dania_url, notice: 'Danie zostało usunięte.' }
    end
  end


  ################################################################################
  # Poniżej znajdują się metody prywatne. Ze względu bezpieczeństwa nie można sie do nich
  # dostać bezpośrednio z poziomu wpisanego adresu w przegądarce
  # Wywoływane są tylko poprzez metody CRUD
  private
    # Wyszukanie dania w bazie danych i zapisanie do zmiennej @danie
    # Kod znajduje sie w poniższej akcji aby nie powtarzać go w akcjach :show, :edit, :update, :destroy
    def set_danie
      @danie = Danie.find(params[:id])
    end

    # Wyszukanie wszystkich możliwych składników w bazie danych i zapisanie do
    # zmiennej @skladniki
    def set_skladniki
      @skladniki = Skladnik.all
    end

    # Zabezpieczenie przed parametrami, których się nie spodziewamy. Odsiewamy tylko znane nam parametry
    def danie_params
      params.require(:danie).permit(:nazwa,
                                    :kategoria_id,
                                    :dodatkowa_wartosc_energetyczna,
                                    :obrazek,
                                    :aktywne,
                                    :opis,
                                    :polecane,
                                    :skladnik_ids => [])
    end
end
