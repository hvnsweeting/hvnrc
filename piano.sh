#!/bin/bash

killall -9 jackdbus
pasuspender qjackctl &
qsynth &
