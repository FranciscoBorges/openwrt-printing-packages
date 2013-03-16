# execute this from your AA cross-compilation directory

#---------------------------------------------------------------
# WARNING: 'make dirclean' is a full clean of your build system.
./scripts/feeds dirclean
#---------------------------------------------------------------

./scripts/feeds update -a
./scripts/feeds uninstall -a
./scripts/feeds install -a -p printing -d m
make defconfig