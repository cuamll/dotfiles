#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import argparse
import numpy as np
import matplotlib.pyplot as plt

def xy_plot(filename, xlabel,
            ylabel, label, output):
    d = np.loadtxt(filename)
    plt.plot(d[:, 0], d[:, 1], label=label)
    plt.xlabel(xlabel)
    plt.ylabel(ylabel)
    if label is not None:
        plt.legend()

    plt.savefig(output)
    

parser = argparse.ArgumentParser(description="Load a 2d array from file and plot as x, y")
parser.add_argument("-f", "--file", help="Data file")
parser.add_argument("-x", "--xlabel", help="xlabel")
parser.add_argument("-y", "--ylabel", help="ylabel")
parser.add_argument("-l", "--label", help="line label")
parser.add_argument("-o", "--output", default="out.pdf",
                    help="Output filename")

args = parser.parse_args()

xy_plot(args.file, args.xlabel,
        args.ylabel, args.label,
        args.output)
