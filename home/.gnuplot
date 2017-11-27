# enable macros
set macros

# search for functions or data files in these directories
set loadpath '~/.config/gnuplot'

# add default line colors
set style line 1 lc rgb '#C4145E' lt 1 lw 3 pt 2 ps 0.75  # red
set style line 2 lc rgb '#A1D490' lt 1 lw 3 pt 4 ps 0.75  # light green
set style line 3 lc rgb '#44A4C2' lt 1 lw 3 pt 6 ps 0.75  # blue
set style line 4 lc rgb '#F2D33C' lt 1 lw 3 pt 8 ps 0.75  # yellow
set style line 5 lc rgb '#832591' lt 1 lw 3 pt 9 ps 0.75  # purple
set style line 6 lc rgb '#E88427' lt 1 lw 3 pt 3 ps 0.75  # orange

# add macros to select the desired line style
RED = "1"
LGREEN = "2"
BLUE = "3"
YELLOW = "4"
PURPLE = "5"
ORANGE = "6"

# add macros to select a desired terminal
AQ = "set terminal aqua dashed font 'Helvetica,20'"
LX = "set terminal cairolatex standalone size 20cm,14cm"
LX_SQ = "set terminal cairolatex standalone size 20cm,20cm"
PNG = "set terminal pngcairo size 350,262 enhanced font 'Verdana,10'"
SVG = "set terminal svg size 350,262 fname \
   'Verdana, Helvetica, Arial, sans-serif' fsize = 10"

# macro for transfer report plots
TR = "set grid xtics mxtics ytics dt 2 lt 2 lc rgb '#666666'"

# Pi tics for correlation plots
PI = "set xtics pi; set ytics pi; set format x '%.0P'; set format y '%.0P'"
