#!/usr/bin/env python3
# -*- coding: utf-8 -*-
'''
Take a set of square data with intensities at each point.
Plot a heatmap. Creates output directory automatically if
it doesn't exist already. To run from terminal do:
    python mpl_imshow.py -i $INPUT_FILE -o $OUTPUT_FILE
To do: allow passing of plot args in parser!
'''

import os
import argparse
import numpy as np
import matplotlib.pyplot as plt
from matplotlib import cm

def plot(arr, filename, plotargs):
    fig, ax = plt.subplots()
    # this line's needed for the colorbar one below, I think
    im = ax.imshow(arr, **plotargs)
    plt.imshow(arr, **plotargs)
    plt.xlabel(r'$ \mathbf{x} $')
    plt.ylabel(r'$ \mathbf{y} $')
    plt.colorbar(im)
    fig.tight_layout()
    plt.savefig(filename, bbox_inches='tight')
    plt.close()

parser = argparse.ArgumentParser()
parser.add_argument("-i", "--input_file", help="input filename")
parser.add_argument("-o", "--output_file", help="output filename")

args = parser.parse_args()
path = os.path.dirname(args.output_file)
if not os.path.exists(path):
    os.mkdir(path)

data = np.loadtxt(args.input_file)
# I assume the input data's square and in the
# form X, Y, Z: we'll plot the Z as a heatmap
z = data[:, 2].reshape( (np.sqrt(len(data)), np.sqrt(len(data))) )
extents = [
    np.min(data[:, 0]), np.max(data[:, 0]),
    np.min(data[:, 1]), np.max(data[:, 1]),
    ]
plotargs = {
    'interpolation': 'None',
    'cmap': 'inferno',
    'origin': 'lower',
    'extent': extents,
    }

plot(z, args.output_file, plotargs)
