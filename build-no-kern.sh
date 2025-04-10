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

find . | cpio -o -H newc >> ../bootfiles/init.cpio
cd ..

cp linux/arch/x86/boot/bzImage bootfiles

mkdir mount
mkdir out

rm out/output.img

dd if=/dev/zero of=out/output.img status=progress bs=1M count=500

mkfs.fat -F 32 out/output.img

syslinux out/output.img

mount out/output.img mount/

echo "DEFAULT /bzImage -initrd=init.cpio" >> mount/syslinux.cfg

cp bootfiles/* mount/

umount mount
rm -rf mount
