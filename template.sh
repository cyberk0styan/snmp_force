#!/bin/bash

file=$HOME'/template'

p1=$(sed -n '1p' < $file)
p2=$(sed -n '2p' < $file)
p3=$(sed -n '3p' < $file)
p4=$(sed -n '4p' < $file)
p5=$(sed -n '5p' < $file)
p6=$(sed -n '6p' < $file)
p7=$(sed -n '7p' < $file)
p8=$(sed -n '8p' < $file)
tmux new-session \; \
        split-window -h \; \
        select-pane -t 1 \; \
        split-window -v \; \
        split-window -v \; \
        select-pane -t 0 \; \
        split-window -v \; \
        select-pane -t 0 \; \
        split-window -v \; \
        select-pane -t 3 \; \
        split-window -v \; \
        select-pane -t 2 \; \
        split-window -v \; \
        select-pane -t 0 \; \
        send-keys "$p1" C-m \; \
        select-pane -t 4 \; \
        send-keys "$p2" C-m \; \
        select-pane -t 1 \; \
        send-keys "$p3" C-m \; \
        select-pane -t 5 \; \
        send-keys "$p4" C-m \; \
        select-pane -t 2 \; \
        send-keys "$p5" C-m \; \
        select-pane -t 6 \; \
        send-keys "$p6" C-m \; \
        select-pane -t 3 \; \
        send-keys "$p7" C-m \; \
        select-pane -t 7 \; \
        send-keys "$p8" C-m \;
