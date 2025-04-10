mkdir root
cd busybox
make
make install
cd _install
cp -R * ../../root
cd ../../

cd root
cp ../customs/init .
chmod +x init
mkdir ../bootfiles
cp -R * ../bootfiles
cd ..

cd linux
make
cd ..

cp linux/arch/x86/boot/bzImage bootfiles

mkdir mount
mkdir out

rm out/output.img

dd if=/dev/zero of=out/output.img status=progress bs=1M count=4000

mkfs.ext4 out/output.img

mount out/output.img mount/

extlinux --install mount/

echo "DEFAULT /bzImage root=/dev/sda rw" >> mount/syslinux.cfg

cp -r bootfiles/* mount/

umount mount
rm -rf mount
