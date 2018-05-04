@LX_SQ
@TR
set output OUTPUT
set print "-"
# FILE =

# XLOWER = 
# XUPPER = 
# YLOWER = 
# YUPPER = 
if (exists("YLOWER") && exists("YUPPER")) set yrange [YLOWER:YUPPER];
if (exists("XLOWER") && exists("XUPPER")) set xrange [XLOWER:XUPPER];

# latex math mode note: pretty sure backslashes need escaping as \\
# also, leave a space at least after leading $

set key top right spacing 2 width 2
set title PLOTTITLE
set xlabel XLABEL
set ylabel YLABEL
set tmargin at screen 0.15
set bmargin at screen 0.85
set lmargin at screen 0.15
set rmargin at screen 0.85

# example of non-tic label
# set label '$ T_{KT} $' at first 0.18,1.6 YUPPER + YUPPER / 50
# set arrow from 0.18,0 to 0.18,1.6 nohead lw 2 dt 2

# set log x

# plot FILE w lp ls @RED title LINETITLE

# for a file with multiple data sets: index 0 is the first dataset
# requires TWO blank lines between datasets
plot FILE using 1:2 index 0 w lp ls @BLUE lw 3 title LINEONE, \
      '' using 1:2 index 1 w lp ls @LGREEN lw 3 title LINETWO, \
      '' using 1:2 index 2 w lp ls @YELLOW lw 3 title LINETHREE, \
      '' using 1:2 index 3 w lp ls @RED lw 2 title LINEFOUR


# other notes: macros @LX_SQ etc are defined in ~/.gnuplot
# plt gnuplot_file.gp outputfile will run gnuplot and compile to outputfile.pdf
