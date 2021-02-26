#!/bin/bash
cd /usr/src/cv
latexmk -shell-escape -pdf -outdir=/usr/src/out main_ru.tex
latexmk -shell-escape -pdf -outdir=/usr/src/out main_en.tex