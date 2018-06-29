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
set xlabel offset 0,-10 XLABEL
set ylabel offset -10,0 YLABEL
set tmargin at screen 0.15
set bmargin at screen 0.85
set lmargin at screen 0.15
set rmargin at screen 0.85

# example of non-tic label
# set label 'KT transition' at first 1.35, YUPPER + YUPPER / 50

plot FILE using 1:4 w lp ls @RED title LINETITLE

# for a file with multiple data sets: index 0 is the first dataset
# requires TWO blank lines between datasets
# plot FILE using 1:2 index 0 w lp ls @RED title 'first block title', \
#       '' using 1:2 index 1 w lp ls @LGREEN title 'second block title', \


# other notes: macros @LX_SQ etc are defined in ~/.gnuplot
# plt gnuplot_file.gp outputfile will run gnuplot and compile to outputfile.pdf
