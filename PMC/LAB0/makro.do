#zamykanie poprzednich symulacji
quit -sim
#mapowanie biblioteki
vmap 155960 work
#kompilacja nazwa jako arg
vcom -work 155960 ./$1 
#odpalenie symulacji
vsim 155960.test 
#wyswietlenie okna wave
view wave -title test_wave 
#wyswietlenie okna sygnalow
view signals 
#dodanie sygnalow do wave
add wave * 

#budowa wymuszen
force c 1 0, 0 {20 ns} -r 40ns
force b 1 0, 0 {40 ns} -r 80ns
force a 1 0, 0 {80 ns} -r 160ns
force d 1 0, 0 {160 ns} -r 230ns

#uruchomienie symulacji czas jako arg
run $2 
#dostosowanie wielkosci okna
wave zoom full 