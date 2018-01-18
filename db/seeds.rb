#
# W tym pliku uzupełniamy bazę danych przy tworzeniu projektu
#

#
# Dodajemy podstawowe kategorie jeśli nie ma żadnej w bazie danych
#
unless Kategoria.any?
  lista_kategorii = %w(Śniadanie Obiad Kolacja)

  lista_kategorii.each do |nazwa_kategorii|
    puts("Dodawanie kategorii: #{nazwa_kategorii}...")
    Kategoria.create(nazwa: nazwa_kategorii)
  end
end


#
# Dodajemy podstawowe składniki dań jeśli nie ma żadnego w bazie danych
#
unless Skladnik.any?
  ##############################################################################
  # Śniadanie
  ##############################################################################
  kategoria_sniadanie = Kategoria.find_by(nazwa: "Śniadanie")

  # Utworenie tablicy skladników
  skladniki = []
  skladniki << Skladnik.create(nazwa: "2 garści kurek", wartosc_energetyczna: 10, obrazek: "https://d.wpimg.pl/2052724119-985108191/kurki.jpg")
  skladniki << Skladnik.create(nazwa: "2 łyżki masła", wartosc_energetyczna: 100, obrazek: "http://polki.pl/pub/wieszjak/p/_wspolne/pliki_infornext/575000/maslo.jpg")
  skladniki << Skladnik.create(nazwa: "2 jajka", wartosc_energetyczna: 80, obrazek: "https://inter-med.pl/wp-content/uploads/2015/04/jajko-to-samo-zdrowie.jpg")

  # stworzenie dania
  danie = Danie.create(
    nazwa: "Jajecznica z kurkami",
    dodatkowa_wartosc_energetyczna: 50,
    obrazek: "http://plcdn.ar-cdn.com/recipes/port960/e4596168-89cd-4b82-91e0-09e8959c82f2.jpg",
    opis: "Aromatyczna jajecznica z kurkami na maśle i ze szczypiorkiem",
    kategoria_id: kategoria_sniadanie.id
  )

  # Dodanie składników do dania
  danie.skladniki << skladniki

  ##############################################################################

  # Utworenie tablicy skladników
  skladniki = []
  skladniki << Skladnik.create(nazwa: "3 jaja", wartosc_energetyczna: 120, obrazek: "https://inter-med.pl/wp-content/uploads/2015/04/jajko-to-samo-zdrowie.jpg")
  skladniki << Skladnik.create(nazwa: "250g mąki", wartosc_energetyczna: 100, obrazek: "http://www.alejakobiet.pl/img/maka.jpg?1393736805543?1393736805543")
  skladniki << Skladnik.create(nazwa: "500 ml mleka", wartosc_energetyczna: 70, obrazek: "http://static.ameco.pl/wszystkodobiura/mleko.jpg")
  skladniki << Skladnik.create(nazwa: "250kg sera białego", wartosc_energetyczna: 120, obrazek: "http://cdn30.beszamel.smcloud.net/t/thumbs/660/441/1/recipes/photo/dlaczego-warto-jesc-bialy-ser.jpg")

  # stworzenie dania
  danie = Danie.create(
    nazwa: "naleśniki z serem",
    dodatkowa_wartosc_energetyczna: 70,
    obrazek: "http://plcdn.ar-cdn.com/recipes/port960/b5aa0490-c513-4b5f-bee6-399c7400b16f.jpg",
    opis: "Naleśniki z nadzieniem serowym to naleśniki posmarowane twarożkiem",
    kategoria_id: kategoria_sniadanie.id
  )

  # Dodanie składników do dania
  danie.skladniki << skladniki




  ##############################################################################
  # obiad
  ##############################################################################
  kategoria_obiad = Kategoria.find_by(nazwa: "Obiad")

  # Utworenie tablicy skladników
  skladniki = []
  skladniki << Skladnik.create(nazwa: "Kurczak", wartosc_energetyczna: 250, obrazek: "http://4.s.dziennik.pl/pliki/3362000/3362727-kurczak-643-385.jpg")
  skladniki << Skladnik.create(nazwa: "2 łyżki przyprawy", wartosc_energetyczna: 10, obrazek: "https://oczymlekarze.pl/images/1/4/2/1142-curry_przedluza_zycie_zdrowe_przyprawy_imbir_kurkuma_kmin_rzymski_kolendra_pieprz_czarny_gorzyca_chilli.jpg")
  skladniki << Skladnik.create(nazwa: "1kg ziemniaków", wartosc_energetyczna: 120, obrazek: "http://www.siewie.pl/zdjecia/najlepsze-ziemniaki.jpg")
  skladniki << Skladnik.create(nazwa: "2 łyżki majonezu", wartosc_energetyczna: 70, obrazek: "http://strefaeko.com.pl/c/116-tm_home_default/majonez-musztardy.jpg")

  # stworzenie dania
  danie = Danie.create(
    nazwa: "Kurczak pieczony",
    dodatkowa_wartosc_energetyczna: 100,
    obrazek: "http://plcdn.ar-cdn.com/recipes/originalxl/fe1653ed-4b17-4888-8901-d82c020d596c.jpg",
    opis: "Pieczony kurczak z obłędnie chrupiącą skórką",
    kategoria_id: kategoria_obiad.id
  )

  # Dodanie składników do dania
  danie.skladniki << skladniki

  ##############################################################################

  # Utworenie tablicy skladników
  skladniki = []
  skladniki << Skladnik.create(nazwa: "4 pstrągi", wartosc_energetyczna: 200, obrazek: "https://www.swiezenatalerze.pl/pol_pl_Pstrag-Klodzki-swiezy-1-sztuka-ok-300g-Pstrag-wpisany-jest-na-Liste-Produktow-Tradycyjnych-200_2.jpg")
  skladniki << Skladnik.create(nazwa: "100g masła", wartosc_energetyczna: 80, obrazek: "http://4.s.dziennik.pl/pliki/5556000/5556525-maslo-900-665.jpg")
  skladniki << Skladnik.create(nazwa: "zioła", wartosc_energetyczna: 5, obrazek: "https://planteon.pl/img/imagecache/product-media/8441d97050245fd6a4ff4e7275b147f125f3857f/Ziola-Prowansalskie-108703-680x680.jpg")

  # stworzenie dania
  danie = Danie.create(
    nazwa: "Pstrąg z masłem",
    dodatkowa_wartosc_energetyczna: 40,
    obrazek: "http://plcdn.ar-cdn.com/recipes/originalxl/bad7a33b-fa1f-46c3-ba1f-7c5ea485eeb5.jpg",
    opis: "Pstrąg pieczony z masłem to danie niezwykle pyszne i aromatyczne.",
    kategoria_id: kategoria_obiad.id
  )

  # Dodanie składników do dania
  danie.skladniki << skladniki


  ##############################################################################

  # Utworenie tablicy skladników
  skladniki = []
  skladniki << Skladnik.create(nazwa: "1/2 kurczaka", wartosc_energetyczna: 125, obrazek: "http://3.bp.blogspot.com/-GFmebvOZJQk/UKZ-E4CAzZI/AAAAAAAADWk/SP2F0KtzvCE/s1600/IMG_20121116_175736.jpg")
  skladniki << Skladnik.create(nazwa: "2 marchewki", wartosc_energetyczna: 30, obrazek: "http://obk.pl/wp-content/uploads/2016/10/marchewka-poznaj-jej-moc-855x485.jpg")
  skladniki << Skladnik.create(nazwa: "1 por", wartosc_energetyczna: 20, obrazek: "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Leeks_bg.JPG/220px-Leeks_bg.JPG")

  # stworzenie dania
  danie = Danie.create(
    nazwa: "Rosół",
    dodatkowa_wartosc_energetyczna: 80,
    obrazek: "http://plcdn.ar-cdn.com/recipes/port250/901c2329-4274-4c53-8570-d7fc742e8917.jpg",
    opis: "Rosół to tradycyjna polska zupa podawana z kluseczkami i makaronem",
    kategoria_id: kategoria_obiad.id
  )

  # Dodanie składników do dania
  danie.skladniki << skladniki




  ##############################################################################
  # kolacja
  ##############################################################################
  kategoria_kolacja = Kategoria.find_by(nazwa: "Kolacja")

  # Utworenie tablicy skladników
  skladniki = []
  skladniki << Skladnik.create(nazwa: "1 bochenek włoskiego chleba", wartosc_energetyczna: 120, obrazek: "http://smakowitychleb.pl/wp-content/uploads/2013/10/pagnotta2.jpg")
  skladniki << Skladnik.create(nazwa: "3 ząbki czosnku", wartosc_energetyczna: 20, obrazek: "http://www.rynek-rolny.pl/images/articles/560/4284723a8e958eb14e609d9cb176f076-czosnek-harnas.jpg")
  skladniki << Skladnik.create(nazwa: "5 łyżek masła", wartosc_energetyczna: 70, obrazek: "https://akademiasmaku.pl/upload/vademecums/25/big/domowe-maslo-25.jpg")

  # stworzenie dania
  danie = Danie.create(
    nazwa: "Grzanki z czosnkiem",
    dodatkowa_wartosc_energetyczna: 20,
    obrazek: "http://plcdn.ar-cdn.com/recipes/port250/a8781074-9fe1-47e3-9697-962aa677225d.jpg",
    opis: "Przepyszne tosty czosnkowe, które pasują do każdego dania kuchni włoskiej.",
    kategoria_id: kategoria_kolacja.id
  )

  # Dodanie składników do dania
  danie.skladniki << skladniki

  ##############################################################################

  # Utworenie tablicy skladników
  skladniki = []
  skladniki << Skladnik.create(nazwa: "2 kromki pieczywa pełnoziarnistego", wartosc_energetyczna: 60, obrazek: "http://kod-zdrowia.pl/wp-content/uploads/2014/02/pieczywo-3.png")
  skladniki << Skladnik.create(nazwa: "2 łyżki serka śmietankowego", wartosc_energetyczna: 20, obrazek: "https://www.tabele-kalorii.pl/photo-1614102/Smietankowy-ser-twarogowy-OSM-Piaski.jpg")
  skladniki << Skladnik.create(nazwa: "6 plastrów ogórka", wartosc_energetyczna: 20, obrazek: "http://zielonetrendy.eu/wp-content/uploads/2015/09/oooo.jpeg")
  skladniki << Skladnik.create(nazwa: "1 pomidor", wartosc_energetyczna: 30, obrazek: "https://upload.wikimedia.org/wikipedia/commons/6/6c/Tomato-global.png")

  # stworzenie dania
  danie = Danie.create(
    nazwa: "Kanapka warzywna",
    dodatkowa_wartosc_energetyczna: 0,
    obrazek: "http://plcdn.ar-cdn.com/recipes/port960/e1d4a7be-630f-451e-9ea4-9191c7aba013.jpg",
    opis: "Super smaczna kanapka warzywna",
    kategoria_id: kategoria_kolacja.id
  )

  # Dodanie składników do dania
  danie.skladniki << skladniki

end
