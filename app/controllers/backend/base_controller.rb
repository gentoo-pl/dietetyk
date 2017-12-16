#
# Główny kontroler panelu administracyjnego po którym muszą dziedziczyć wszystkie inne kontrolery
# Odpowiedzialny jest za zabezpieczenie dostępu do panelu hasłem i loginem
# oraz za wybór pliku z layoutem
#
class Backend::BaseController < ApplicationController
  # Zabezpiecz dostęp nazwą użytkownika oraz hasłem
  http_basic_authenticate_with name: "uczen", password: "uczen"

  # Wybierz layout z /app/views/layouts/backend.html.erb
  layout "backend"
end
