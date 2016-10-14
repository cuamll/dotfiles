# enable macros
set macros

# search for functions or data files in these directories
# set loadpath '/usr/local/lib/gnuplot'

# add default line colors
set style line 1 lc rgb '#C4145E' lt 1 lw 3 pt 5   # red
set style line 2 lc rgb '#A1D490' lt 1 lw 3 pt 7   # light green
set style line 3 lc rgb '#44A4C2' lt 1 lw 3 pt 4   # blue

# add macros to select the desired line style
RED = "1"
LGREEN = "2"
BLUE = "3"

# add macros to select a desired terminal
AQ = "set terminal aqua dashed enhanced font 'Helvetica,20'"
PNG = "set terminal pngcairo size 350,262 enhanced font 'Verdana,10'"
SVG = "set terminal svg size 350,262 fname \
   'Verdana, Helvetica, Arial, sans-serif' fsize = 10"

# macro for transfer report plots
TR = "set grid xtics mxtics ytics dt 3 lc rgb '#888888'"
