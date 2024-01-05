COPY_MORE_MAKEFILES = $(COPY) ../src_makefiles/zlib/Makefile $(OUTPUT_DIR)/zlib/Makefile

IGN_FILES := \
  cjpeg.c djpeg.c dpmainc.c echogs.c \
  gdev3852.c gdev3b1.c gdev4693.c gdevbgi.c gdevbj10.c gdevbmp.c gdevccr.c \
  gdevcgml.c gdevcp50.c gdevdfax.c gdevdjet.c gdevdjtc.c gdevepsc.c gdevevga.c \
  gdevherc.c gdevimgn.c gdevjpeg.c gdevl256.c gdevlj56.c gdevln03.c gdevmgr.c \
  gdevmiff.c gdevmswn.c gdevmsxf.c gdevn533.c gdevos2p.c gdevp2up.c gdevpbm.c \
  gdevpcx.c gdevpjet.c gdevpm.c gdevpng.c gdevprn.c gdevpsim.c gdevrrgb.c \
  gdevsgi.c gdevsnfb.c gdevsppr.c gdevsun.c gdevsvga.c gdevtfax.c gdevtfnx.c \
  gdevtknk.c gdevupd.c gdevvglb.c gdevwddb.c gdevwdib.c gdevwpr2.c gdevwprn.c \
  gdevx.c gdevxalt.c gdevxes.c gdevxini.c gdevxxf.c \
  genarch.c genconf.c gp_dosfb.c gp_dosfe.c gp_dosfs.c gp_itbc.c gp_iwatc.c \
  gp_msdos.c gp_mswin.c gp_ntfs.c gp_os2.c gp_os9.c gp_vms.c gp_win32.c \
  gs16spl.c gsdll.c gsjerror.c gspmdrv.c icfontab.c \
  jcapimin.c jcapistd.c jccoefct.c jccolor.c jcdctmgr.c jchuff.c jcinit.c \
  jcmainct.c jcmarker.c jcmaster.c jcomapi.c jcparam.c jcphuff.c jcprepct.c \
  jcsample.c jctrans.c \
  jdapimin.c jdapistd.c jdatadst.c jdatasrc.c jdcoefct.c jdcolor.c jddctmgr.c \
  jdhuff.c jdinput.c jdmainct.c jdmarker.c jdmaster.c jdmerge.c jdphuff.c \
  jdpostct.c jdsample.c jdtrans.c jerror.c jfdctflt.c jfdctfst.c jfdctint.c \
  jidctflt.c jidctfst.c jidctint.c jidctred.c \
  jmemansi.c jmemmgr.c jmemname.c jmemnobs.c \
  jpegtran.c jquant1.c jquant2.c \
  rdbmp.c rdcolmap.c rdgif.c rdjpgcom.c rdppm.c rdrle.c rdswitch.c rdtarga.c \
  scfdgen.c wrbmp.c wrgif.c wrjpgcom.c wrppm.c wrrle.c wrtarga.c zdosio.c \
  jpeg-6a/cdjpeg.c jpeg-6a/jmemdos.c jpeg-6a/jmemmac.c \
  libpng/example.c

PRE_INSTR_CMDS = \
  $(COPY) src_makefiles/arch.h $(OUTPUT_DIR); \
  $(COPY) src_makefiles/gconfig_.h $(OUTPUT_DIR); \
  $(COPY) src_makefiles/gconfigv.h $(OUTPUT_DIR); \
  $(COPY) src_makefiles/gconfxx.h $(OUTPUT_DIR)

GCC_OPTS = -I $(OUTPUT_DIR) -I $(OUTPUT_DIR)/jpeg-6a -I $(OUTPUT_DIR)/zlib -Dconst= -Wall -Wpointer-arith -Wstrict-prototypes -Wno-unused-function -Wno-unused-label -Wno-unused-variable -Wno-unused-but-set-variable -Wno-unused-value -Wno-unused-result -Wno-misleading-indentation -Wno-dangling-else

ERROR_FILES := output_RUNTYPE.err

include ../../Makefile.default.acc
