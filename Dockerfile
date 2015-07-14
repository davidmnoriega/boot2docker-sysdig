FROM boot2docker/boot2docker

# Build sysdig kernel module
ENV SYSDIG_REPO https://github.com/draios/sysdig.git
ENV SYSDIG_TAG 0.1.101

RUN apt-get update && apt-get -y install cmake && \
  git clone --branch "$SYSDIG_TAG" "$SYSDIG_REPO"  /sysdig && \
  mkdir /sysdig/build && \
  cd /sysdig/build && \
  cmake .. && \
  cd driver && \
  KERNELDIR=$ROOTFS/lib/modules/$KERNEL_VERSION-boot2docker/build make && \
  cp sysdig-probe.ko $ROOTFS/lib/modules/$KERNEL_VERSION-boot2docker/extra && \
  depmod -a -b $ROOTFS $KERNEL_VERSION-boot2docker

RUN /make_iso.sh

CMD ["cat", "boot2docker.iso"]
