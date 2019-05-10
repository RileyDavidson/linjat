#!/bin/bash

set -e

MAP_HEIGHT=10 MAP_WIDTH=10 PIECES=20 cmake . && make
bin/mklinjat --puzzle_count=1 --seed=90210 --solve_progress_file=progress-opt.json --score_cover=1 --score_cant_fit=3 --score_square=50 --score_dep=100 --score_one_of=60 --score_max_width=-1
perl vis.pl < progress-opt.json > progress-opt.svg

MAP_HEIGHT=8 MAP_WIDTH=8 PIECES=15 cmake . && make
bin/mklinjat --puzzle_count=1 --seed=90210 --candidate_progress_file=dots-opt.json --score_cover=1 --score_cant_fit=3 --score_square=50 --score_dep=100 --score_one_of=60 --score_max_width=-1 --optimize_iterations=0
perl vis.pl < dots-opt.json > dots-opt.svg

