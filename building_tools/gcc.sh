update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.8 48 \
        --slave /usr/bin/g++ g++ /usr/bin/g++-4.8 \
        --slave /usr/bin/gcc-ar gcc-ar /usr/bin/gcc-ar-4.8 \
        --slave /usr/bin/gcc-nm gcc-nm /usr/bin/gcc-nm-4.8 \
        --slave /usr/bin/gcc-ranlib gcc-ranlib /usr/bin/gcc-ranlib-4.8

update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-5 55 \
    --slave /usr/bin/g++ g++ /usr/bin/g++-5 \
    --slave /usr/bin/gcc-ar gcc-ar /usr/bin/gcc-ar-5 \
    --slave /usr/bin/gcc-nm gcc-nm /usr/bin/gcc-nm-5 \
    --slave /usr/bin/gcc-ranlib gcc-ranlib /usr/bin/gcc-ranlib-5

