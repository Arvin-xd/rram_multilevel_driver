set grid
set style line 11 lc rgb '#333333' lt 1
set border 3 back ls 11
set tics nomirror


# color definitions
# set style line 1  lc rgb '#8e0200' lt 1 lw 1 pt 6 ps 1 # ---red
# set style line 2  lc rgb '#007ea7' lt 1 lw 2 pt 7 # -- remaining blues and greens
# set style line 3  lc rgb '#0042ad' lt 1 lw 2 pt 8
set style line 1 lt 1 lw 4 pt 7 ps 0.5 lc rgb '#0072bd' # blue ps variable
set style line 2 lt 1 lw 4 pt 7 ps 0.5 lc rgb '#ff0000' # other colors
set style line 3 lt 1 lw 4 pt 7 ps 0.5 lc rgb '#ff7800' # other colors
set style line 4 lt 1 lw 4 pt 7 ps 0.5 lc rgb '#4ec000' # other colors
set style line 5 lt 1 lw 4 pt 7 ps 0.5 lc rgb '#a049c0' # other colors
set style line 6 lt 1 lw 4 pt 7 ps 0.5 lc rgb '#8e0200' # other colors
set style fill solid

set format x "%g"
set format y "%g"
set lmargin 10
set bmargin 2

# set xrange [0:50]


set datafile separator ","

################
## simulation Parameters
# gaps
# [1.2e-9, 1.3e-9, 1.367e-9, 1.5e-9, 1.6e-9, 1.7e-9]
# lengths: 5-gap
# []
# r_loads: 250, 500, 750... 256k


################
# file 1, read Resistances
#############################

set term svg noenhanced size 1400,1800 font 'Times,25' # fname 'Times' #fsize 35
set output "read_resistances.svg"
set xlabel "Load resistance [KOhms]"
set ylabel "Read resistance  at 0.1V [KOhms]"

set multiplot layout 3,1

unset key

input_file='processed.csv'
levels=32
level_sep=4
r_diff=250
get_load(x)=r_diff*level

set title 'Temperature'
plot for [i=1:levels:level_sep] input_file u (column(1)):(column(i+1)) w lp ls i axes x1y1 notitle

set title 'Read Resistance'
plot for [i=1:levels:level_sep] input_file u (column(1)):(column(levels+i+1)) w lp ls i axes x1y1 notitle



set key title 'Rs load'
# set key below
set key center center
set border 0
unset tics
unset xlabel
unset ylabel
set yrange [0:1]

plot for [i=1:levels:level_sep] 2 w lp ls 1 t get_load(i).' ohms', \

unset border
unset yrange
set tics
set xlabel
set ylabel

unset multiplot
unset output
