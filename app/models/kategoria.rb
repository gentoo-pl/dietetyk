# == Schema Information
#
# Table name: kategorie
#
#  id         :integer          not null, primary key
#  nazwa      :string           not null
#  aktywna    :boolean          default(TRUE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Kategoria < ApplicationRecord
  has_many :dania

  #
  # Metoda zwraca ilość dań przypisanych do kategorii
  #
  def ilosc_dan
    self.dania.size
  end
end
