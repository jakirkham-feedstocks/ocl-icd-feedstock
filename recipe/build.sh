set -e

export OCL_ICD_VENDORDIR="${PREFIX}/etc/OpenCL/vendors"

# Make sure `conda-build` keeps this directory.
mkdir -p "${OCL_ICD_VENDORDIR}"
touch "${OCL_ICD_VENDORDIR}/.conda_keep"

./bootstrap

./configure \
  --prefix=$PREFIX \
  --enable-official-khronos-headers \
  --enable-custom-vendordir="${OCL_ICD_VENDORDIR}"

make
make check
make install
