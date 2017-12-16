# W poniższym pliku możemy zdefiniować jak Railsy mają tłumaczyć nazwy np. polskie z liczby
# mnogiej na pojedyńczą i na odwrót.

ActiveSupport::Inflector.inflections(:en) do |inflect|
  inflect.irregular 'kategoria', 'kategorie'
  inflect.irregular 'danie', 'dania'
  inflect.irregular 'skladnik', 'skladniki'
end
