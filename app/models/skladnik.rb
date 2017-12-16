# == Schema Information
#
# Table name: skladniki
#
#  id                   :integer          not null, primary key
#  nazwa                :string           not null
#  wartosc_energetyczna :integer          default(0)
#  opis                 :text
#  obrazek              :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class Skladnik < ApplicationRecord
  # składnik może być wykorzystany przy wilu daniach
  has_and_belongs_to_many :dania
end
