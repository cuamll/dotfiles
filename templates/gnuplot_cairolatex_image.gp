@LX_SQ
@TR
set output OUTPUT
set print "-"

# FILE =

# PALETTE = '~/.config/gnuplot/jet.pal'
if (exists("PALETTE")) load PALETTE

# PLOTTITLE =
if (exists("PLOTTITLE")) set title PLOTTITLE
unset key
# set view map
set tmargin at screen 0.15
set bmargin at screen 0.85
set lmargin at screen 0.15
set rmargin at screen 0.85

# sets xtics pi etc, for plotting Fourier space correlation functions
@PI

plot FILE w image
