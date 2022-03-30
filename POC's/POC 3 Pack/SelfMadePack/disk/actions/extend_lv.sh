#!/bin/bash

sudo lvextend -L +${2}G $1

sudo resize2fs $1

