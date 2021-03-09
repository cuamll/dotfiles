#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import argparse
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.colors as colors

def log_2d_plot(filename, xlabel,
            ylabel, label, output):
    d = np.loadtxt(filename)
    d = np.ma.masked_where(d == 0., d)
    fig, ax = plt.subplots()
    norm = colors.LogNorm(vmin=d.min(), vmax=d.max())
    # symmetric log with linear bit around 0! very useful
    # norm = colors.SysLogNorm(linthresh=0.1, linscale=1.0, 
    #                          base=10, vmin=d.min(), vmax=d.max())
    im = ax.imshow(d, norm=norm)
    plt.imshow(d, norm=norm)
    plt.colorbar(im, label=label, norm=norm)
    plt.xlabel(xlabel)
    plt.ylabel(ylabel)
    plt.savefig(output)
    

parser = argparse.ArgumentParser(description="Load a 2d array from file and plot as x, y")
parser.add_argument("-f", "--file", help="Data file")
parser.add_argument("-x", "--xlabel", help="xlabel")
parser.add_argument("-y", "--ylabel", help="ylabel")
parser.add_argument("-l", "--label", help="line label")
parser.add_argument("-o", "--output", default="out.pdf",
                    help="Output filename")

args = parser.parse_args()

log_2d_plot(args.file, args.xlabel,
        args.ylabel, args.label,
        args.output)
