#!/bin/bash

#simple script to run a new vsim simulation


source /eda/scripts/init_questa_core_prime

vdel -all
vlib work
vcom -f compile_src.f -mixedsvvh
vlog -f compile_sv.f -mixedsvvh

vsim -c -do sim.do rca_tb
