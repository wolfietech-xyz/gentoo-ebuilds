# WolfieTech Custom Gentoo Ebuilds
Shared ebuilds that may prove useful


## libsdl2-compat
Provides libsdl2 on top of libsdl3, should add media-libs/libsdl2 to your "/etc/portage/package.provided" if you want to replace the default sdl2 native implementation. Will considers pr's
to allow for slotted installs alongside libsdl2 native. 



# Packages to fix dracut and clevis

## app-crypt/clevis v21
forked from guru, added required deps, use(s), and patches libccid.so's path in ''src/luks/dracut/clevis-pin-pkcs11/module-setup.sh.in''

## sys-kernel/dracut v103r4

fix libccid.so path in modules.d/91pcsc/module-setup.sh
