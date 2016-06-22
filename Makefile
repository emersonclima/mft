INSTALL_TOP= /usr/local
INSTALL_LMOD= $(INSTALL_TOP)/share/lua/$V

# How to install. If your install program does not support "-p", then
# you may have to run ranlib on the installed liblua.a.
INSTALL= install -p
INSTALL_DATA= $(INSTALL) -m 0644

#
# If you don't have "install" you can use "cp" instead.
# INSTALL= cp -p
# INSTALL_EXEC= $(INSTALL)
# INSTALL_DATA= $(INSTALL)

# Other utilities.
MKDIR= mkdir -p
RM= rm -f

# == END OF USER SETTINGS -- NO NEED TO CHANGE ANYTHING BELOW THIS LINE =======

# What to install.
TO_LMOD= fasta.lua

# Lua version and release.
V= 5.3
R= $V.3

install: dummy
	cd src && $(MKDIR) $(INSTALL_LMOD) 	
	cd src && $(INSTALL_DATA) $(TO_LMOD) $(INSTALL_LMOD)

uninstall:
	cd src && cd $(INSTALL_LMOD) && $(RM) $(TO_LMOD)
	
local:
	$(MAKE) install INSTALL_TOP=../install

# make may get confused with test/ and install/
dummy:

# list targets that do not create files (but not all makes understand .PHONY)
.PHONY: all clean test install local none dummy echo pecho lecho

# (end of Makefile)
