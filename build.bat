
@echo off

..\..\yad\svn\pentevo\tools\asl\bin\asl -U -L -x -olist lst\miniboot.lst -D ADRLOAD=0x4000 miniboot.a80
..\..\yad\svn\pentevo\tools\asl\bin\p2bin miniboot.p rom/miniboot.rom -r $-$ -k

..\..\yad\svn\pentevo\tools\mhmt\mhmt -mlz rom/miniboot.rom rom/miniboot_pack.rom

rem copy /Y /B rom\miniboot.rom D:\yad\unrealspeccy\miniboot.rom

..\..\yad\svn\pentevo\tools\asl\bin\asl -U -L -x -olist lst\make_scl.lst -D ADRLOAD=0x4000 make_scl.a80
..\..\yad\svn\pentevo\tools\asl\bin\p2bin make_scl.p rom/make_scl.rom -r $-$ -k

..\..\yad\svn\pentevo\tools\csum32\csum32 rom\make_scl.rom
copy /B /Y rom\make_scl.rom+csum32.bin bin\minibootsd.scl

..\..\yad\svn\pentevo\tools\asl\bin\asl -U -L -x -olist lst\make_rom.lst -D ADRLOAD=0x4000 make_rom.a80
..\..\yad\svn\pentevo\tools\asl\bin\p2bin make_rom.p bin\miniboot.rom -r $-$ -k

del *.bin
