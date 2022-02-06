Composer.destroy_all
Manufacturer.destroy_all
Piece.destroy_all
Piano.destroy_all

chopin = Composer.create!(name: "Frédéric François Chopin", birth_year: 1810, death_year: 1849, musical_era: "Romantic", num_compositions: 210, tonal: true, ethnicity: 'Polish')
beethoven = Composer.create!(name: 'Ludwig van Beethoven', birth_year: 1770, death_year: 1827, musical_era: "Classical", num_compositions: 722, tonal: true, ethnicity: 'German')
rachmaninoff = Composer.create!(name: 'Sergei Rachmaninoff', birth_year: 1873, death_year: 1943, musical_era: "Romantic", num_compositions: 50, tonal: true, ethnicity: 'Russian')
bach = Composer.create!(name: 'Johann Sebastian Bach', birth_year: 1685, death_year: 1750, musical_era: "Baroque", num_compositions: 1128, tonal: true, ethnicity: 'German')

steinway = Manufacturer.create!(maker: "Steinway & Sons", location: "Manhattan, USA", year_opened: "1853", family_owned: true, ceo: "Ron Losby")
bechstein = Manufacturer.create!(maker: "C. Bechstein", location: "Berlin, Germany", year_opened: "1853", family_owned: true, ceo: "Stefan Freymuth")
yamaha = Manufacturer.create!(maker: "Yamaha", location: "Hamamatsu, Japan", year_opened: "1887", family_owned: false, ceo: "Yoshihiro Hidaka")
nord = Manufacturer.create!(maker: "Nord", location: "Stockholm, Sweden", year_opened: "1983", family_owned: true, ceo: "Hans Nordelius")
bösendorfer = Manufacturer.create!(maker: "Bösendorfer", location: "Vienna, Austria", year_opened: "1828", family_owned: false, ceo: "Yoshihiro Hidaka")

chopin.pieces.create!(opus: 47, number: nil, type_of_piece: "Ballad", composition_date: 1841, multiple_instruments: false, main_instrument: "piano", key_signature: "A-flat major")
chopin.pieces.create!(opus: 35, number: nil, type_of_piece: "Sonata", composition_date: 1840, multiple_instruments: false, main_instrument: "piano", key_signature: "B-flat minor", nickname: 'Funeral March')
chopin.pieces.create!(opus: 21, number: nil, type_of_piece: "Concerto", composition_date: 1830, multiple_instruments: true, main_instrument: "piano", key_signature: "F minor")
chopin.pieces.create!(opus: 10, number: 3, type_of_piece: "Etude", composition_date: 1833, multiple_instruments: false, main_instrument: "piano", key_signature: "E major", nickname:'Tristesse')
chopin.pieces.create!(opus: 10, number: 8, type_of_piece: "Etude", composition_date: 1833, multiple_instruments: false, main_instrument: "piano", key_signature: "F major")
chopin.pieces.create!(opus: 10, number: 12, type_of_piece: "Etude", composition_date: 1833, multiple_instruments: false, main_instrument: "piano", key_signature: "C minor", nickname:'Revolutionary')
chopin.pieces.create!(opus: 25, number: 1, type_of_piece: "Etude", composition_date: 1837, multiple_instruments: false, main_instrument: "piano", key_signature: "A-flat major", nickname: 'Aeolian Harp')

beethoven.pieces.create!(opus: 7, type_of_piece: "Sonata", composition_date: 1796, multiple_instruments: false, main_instrument: "piano", key_signature: "E-flat major", nickname: 'Grand Sonata')

beethoven.pieces.create!(opus: 13, type_of_piece: "Sonata", composition_date: 1798, multiple_instruments: false, main_instrument: "piano", key_signature: "C minor", nickname: 'Pathetique')

beethoven.pieces.create!(opus: 26, type_of_piece: "Sonata", composition_date: 1800, multiple_instruments: false, main_instrument: "piano", key_signature: "A-flat major")

beethoven.pieces.create!(opus: 27, number:2, type_of_piece: "Sonata", composition_date: 1801, multiple_instruments: false, main_instrument: "piano", key_signature: "C-sharp minor", nickname: 'Moonlight')

beethoven.pieces.create!(opus: 31, number:2, type_of_piece: "Sonata", composition_date: 1801, multiple_instruments: false, main_instrument: "piano", key_signature: "D minor", nickname: 'Tempest')

beethoven.pieces.create!(opus: 53, type_of_piece: "Sonata", composition_date: 1804, multiple_instruments: false, main_instrument: "piano", key_signature: "C major", nickname: 'Waldstein')

beethoven.pieces.create!(opus: 57, type_of_piece: "Sonata", composition_date: 1805, multiple_instruments: false, main_instrument: "piano", key_signature: "A-flat major", nickname: 'Apassionata')

beethoven.pieces.create!(opus: 81, type_of_piece: "Sonata", composition_date: 1809, multiple_instruments: false, main_instrument: "piano", key_signature: "E-flat major", nickname: 'Les Adieux')

beethoven.pieces.create!(opus: 58, type_of_piece: "Concerto", composition_date: 1805, multiple_instruments: true, main_instrument: "piano", key_signature: "G major")

beethoven.pieces.create!(opus: 120, type_of_piece: "Variations", composition_date: 1823, multiple_instruments: false, main_instrument: "piano", key_signature: "C major", nickname: 'Diabelli Variations')

rachmaninoff.pieces.create(opus: 32, number: 10, type_of_piece: "Prelude", composition_date: 1910, multiple_instruments: false, main_instrument: "piano", key_signature: "B minor")

rachmaninoff.pieces.create(opus: 23, number: 4, type_of_piece: "Prelude", composition_date: 1901, multiple_instruments: false, main_instrument: "piano", key_signature: "D minor")

rachmaninoff.pieces.create(opus: 23, number: 5, type_of_piece: "Prelude", composition_date: 1901, multiple_instruments: false, main_instrument: "piano", key_signature: "G minor")

rachmaninoff.pieces.create(opus: 33, number: 5, type_of_piece: "Etude", composition_date: 1903, multiple_instruments: false, main_instrument: "piano", key_signature: "D minor")

rachmaninoff.pieces.create(opus: 39, number: 2, type_of_piece: "Etude", composition_date: 1916, multiple_instruments: false, main_instrument: "piano", key_signature: "A minor")

rachmaninoff.pieces.create(opus: 32, number: 5, type_of_piece: "Etude", composition_date: 1916, multiple_instruments: false, main_instrument: "piano", key_signature: "E-flat minor")

rachmaninoff.pieces.create(opus: 23, number: 5, type_of_piece: "Etude", composition_date: 1916, multiple_instruments: false, main_instrument: "piano", key_signature: "E-flat minor")

bach.pieces.create(opus: 825, number: 1, type_of_piece: "Partita", composition_date: 1726, multiple_instruments: false, main_instrument: "piano", key_signature: "B-flat major")

bach.pieces.create(opus: 825, number: 1, type_of_piece: "Prelude-Fugue", composition_date: 1722, multiple_instruments: false, main_instrument: "piano", key_signature: "C-sharp major", nickname: 'Well Tempered Klavier')

bach.pieces.create(opus: 816, number: 5, type_of_piece: "Suite", composition_date: 1722, multiple_instruments: false, main_instrument: "piano", key_signature: "French")

steinway.pianos.create!(model: "Model D", style: "Concert Grand", price: 150000, color: "black", acoustic: true) #length: "8ft 11in")
steinway.pianos.create!(model: "Model B", style: "Concert Grand", price: 101700, color: "black", acoustic: true) #length: "6ft 10in")
steinway.pianos.create!(model: "Model A", style: "Concert Grand", price: 85000, color: "black", acoustic: true) #length: "6ft 2in")
steinway.pianos.create!(model: "Model O", style: "Concert Grand", price: 70000, color: "black", acoustic: true) #length: "5ft 10in")

bechstein.pianos.create!(model: "D 282", style: "Concert Grand", price: 269900, color: "black", acoustic: true) #length: "5ft 3in")
bechstein.pianos.create!(model: "A 114", style: "Upright", price: 27900, color: "black", acoustic: true) #length: "2ft 2in")
bechstein.pianos.create!(model: "A 208", style: "Concert Grand", price: 81900, color: "black", acoustic: true) #length: "6ft 1in")
bechstein.pianos.create!(model: "A 192", style: "Concert Grand", price: 166900, color: "brown", acoustic: true) #length: "4ft 11in")

yamaha.pianos.create!(model: "Clavinova CLP-775", style: "Digital", price: 5000, color: "black or brown", acoustic: false) #length: "1ft 8in")

nord.pianos.create!(model: "Stage 3", style: "Digital", price: 4700, color: "red", acoustic: false) #length: "1ft 4in"
nord.pianos.create!(model: "Electro 5", style: "Digital", price: 3300, color: "red", acoustic: false) #length: "1ft 2in")
nord.pianos.create!(model: "Piano 5", style: "Digital", price: 3500, color: "red", acoustic: false) #length: "1ft 5in")

bösendorfer.pianos.create!(model: "290 Imperial", style: "Concert Grand", price: 126999, color: "black", acoustic: true) #length: "9ft 6in")
