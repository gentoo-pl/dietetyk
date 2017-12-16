#
# @TODO - wprowadź zmianę w definicji kalsy tak aby użyty został layout 'backend'
#         oraz aby kontroler był zabezpieczony hasłem
#
class Backend::KategorieController < ApplicationController
  before_action :set_kategoria, only: [:show, :edit, :update, :destroy]

  ##############################################################################
  # Lista wszystkich kategorii dań
  # @path /backend/kategorie
  #
  def index
    @kategorie = Kategoria.all
  end


  ##############################################################################
  # Wyświetlenie pojedyńczej kategorii dania
  # @path /backend/kategorie/1
  #
  def show
  end

  ##############################################################################
  # Wyświetlenie formularza do dodawania kategorii
  # @path /backend/kategorie/new
  #
  def new
    @kategoria = Kategoria.new
  end

  ##############################################################################
  # Wyświetlenie formularza do edycji
  # @path /backend/kategorie/1/edit
  #
  def edit
  end

  ##############################################################################
  # Zapisanie kategorii do bazy danych. Po kliknięciu przycisku "Dodaj kategorię"
  #
  def create
    @kategoria = Kategoria.new(kategoria_params)

    if @kategoria.save
      redirect_to [:backend, @kategoria], notice: 'Kategoria została dodana.'
    else
      # coś poszło nie tak (może nie przeszło walidacji w modelu), formularz znowu się wyświetla z zaznaczonymi błędami
      render :new
    end
  end

  ##############################################################################
  # Zapisanie zmienionej kategorii do bazy. Po kliknięciu przycisku "Zmień kategorię"
  #
  def update
    if @kategoria.update(kategoria_params)
      redirect_to [:backend, @kategoria], notice: 'Kategoria została zmieniona.'
    else
      # coś poszło nie tak (może nie przeszło walidacji w modelu), formularz znowu się wyświetla z zaznaczonymi błędami
      render :edit
    end
  end

  ##############################################################################
  # Usunięcie kategorii
  #
  def destroy
    @kategoria.destroy
    redirect_to backend_kategorie_url, notice: 'Kategoria została usunięta'
  end

  ################################################################################
  # Poniżej znajdują się metody prywatne. Ze względu bezpieczeństwa nie można sie do nich
  # dostać bezpośrednio z poziomu wpisanego adresu w przegądarce
  # Wywoływane są tylko poprzez metody CRUD
  private
    # Wyszukanie kategorii w bazie danych.
    # Kod znajduje sie w poniższej akcji aby nie powtarzać go w akcjach :show, :edit, :update, :destroy
    def set_kategoria
      @kategoria = Kategoria.find(params[:id])
    end

    # Zabezpieczenie przed parametrami, których się nie spodziewamy. Odsiewamy tylko znane nam parametry
    def kategoria_params
      params.require(:kategoria).permit(:nazwa, :aktywna)
    end
end
