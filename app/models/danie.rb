# == Schema Information
#
# Table name: dania
#
#  id                             :integer          not null, primary key
#  nazwa                          :string           not null
#  suma_wartosci_energetycznej    :integer          default(0)
#  dodatkowa_wartosc_energetyczna :integer          default(0)
#  obrazek                        :string
#  aktywne                        :boolean          default(TRUE)
#  opis                           :text
#  polecane                       :boolean          default(FALSE)
#  created_at                     :datetime         not null
#  updated_at                     :datetime         not null
#  kategoria_id                   :integer
#

class Danie < ApplicationRecord
  scope :aktywne, -> { where(aktywne: true) } # pobierane z bazy tylko aktywne dania
  scope :polecane, -> { where(polecane: true) } # pobierane z bazy tylko polecane

  # wywołanie metody :zapisz_sume_wartosci_energetycznej przed każdym zapisem do
  # bazy ( dodanie lub zmiana dania)
  after_save :zapisz_sume_wartosci_energetycznej
  after_touch :zapisz_sume_wartosci_energetycznej # dla seedów


  # Danie może być złożone z wielu składników
  has_and_belongs_to_many :skladniki

  belongs_to :kategoria


  private

    # poniższa metoda odpowiedzialna jest za prawidłowe zarządzanie polem
    def zapisz_sume_wartosci_energetycznej(skladnik = nil)
      # zmienna suma_skladnikow zawiera sumę wartości energetycznej wszystkich składników
      # wchodzących w sklad dania
      suma_skladnikow = skladniki.sum(:wartosc_energetyczna)
      # Ustawiam wartość pola w bazie suma_wartosci_energetycznej poprzez dodanie
      # sumy wartości energetycznej składników i dodatkowej wartości energetycznej dania
      suma_sum = suma_skladnikow + self.dodatkowa_wartosc_energetyczna

      update_column(:suma_wartosci_energetycznej, suma_sum)
    end
end
