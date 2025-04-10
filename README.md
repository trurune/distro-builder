# distro-builder
Distro builder is a short program I built to build a small busybox + linux distribution.

\Step 1. Clone linux source code
\Step 2. Clone busybox source code
\Step 3. Ensure linux is named 'linux' and busybox is named 'busybox'
\Step 4. *VERY IMPORTANT* PLEASE, make sure that busybox is being compiled as static, this will save you headaches (you can also compile a libc and copy that into your root folder, that is created after compiling at least once)
\Step 5. Run ./build.sh (or alternatively ./build-no-kern.sh to build without the kernel to save time if you haven't made any new configs to it)
\Step 6. There you go, out/output.img should contain your image.
