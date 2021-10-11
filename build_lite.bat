@echo on
echo Deleting old build...
del xdcgui.exe
DCC32.EXE xdcgui.dpr -DNORMALBUILD -CG -Q -B+ -$B- -$D- -$A8+ -$Q- -$R- -$L- -$M- -$O+ -$W- -$Y- -$Z1- -$J- -$C- -$U- -$I-
del *.dsk
del *.dcu
del *.~*
del *.bak
del *.ddp
call upx.cmd xdcgui.EXE