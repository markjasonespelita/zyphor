## [0.0.37](https://github.com/markjasonespelita/zyphor_os/compare/v0.0.36...v0.0.37) (2026-04-15)


### Bug Fixes

* replaced the /includes installer usr share graphics logo debian banner with much larger width banner, but its still the same image. ([c6cc967](https://github.com/markjasonespelita/zyphor_os/commit/c6cc96744e970f6a11635648a89cf3563579bfc0))

## [0.0.36](https://github.com/markjasonespelita/zyphor_os/compare/v0.0.35...v0.0.36) (2026-04-15)


### Bug Fixes

* replace = separator on the /boot/grub/themes/kali/themes.txt ([2bdc9c6](https://github.com/markjasonespelita/zyphor_os/commit/2bdc9c61b26ca76c73f774b6711921e341ed481a))

## [0.0.35](https://github.com/markjasonespelita/zyphor_os/compare/v0.0.34...v0.0.35) (2026-04-15)


### Bug Fixes

* moved the /boot folder in the root folder rather than inside the /etc. ([06d2f6f](https://github.com/markjasonespelita/zyphor_os/commit/06d2f6f8cb718eac21d399db7b7da79941bc34cb))

## [0.0.34](https://github.com/markjasonespelita/zyphor_os/compare/v0.0.33...v0.0.34) (2026-04-14)


### Bug Fixes

* modified the initial grub bootloader background image and installer banner. ([7b2e1e1](https://github.com/markjasonespelita/zyphor_os/commit/7b2e1e169ed3971b2600cf57cfc7157db9894b9b))

## [0.0.33](https://github.com/markjasonespelita/zyphor_os/compare/v0.0.32...v0.0.33) (2026-04-14)


### Bug Fixes

* added DOCUMENTATION folder for the written documentation files and folders for the build overrides - for xfce4 desktop environment. ([36fbdfb](https://github.com/markjasonespelita/zyphor_os/commit/36fbdfb2111177d26803a5bbcadff5f145467c2c))

## [0.0.32](https://github.com/markjasonespelita/zyphor_os/compare/v0.0.31...v0.0.32) (2026-04-13)


### Bug Fixes

* renamed whiskermenu default.rc to defaults.rc. ([5cf2474](https://github.com/markjasonespelita/zyphor_os/commit/5cf24743f310d3837abf43a8ec1020c5c68e6ffd))

## [0.0.31](https://github.com/markjasonespelita/zyphor_os/compare/v0.0.30...v0.0.31) (2026-04-13)


### Bug Fixes

* modified whiskermenu by utilizing .face of the zyphor os. ([eeae1cc](https://github.com/markjasonespelita/zyphor_os/commit/eeae1ccd11a0ecb1606f24c6aa72bd49d8365967))

## [0.0.30](https://github.com/markjasonespelita/zyphor_os/compare/v0.0.29...v0.0.30) (2026-04-13)


### Bug Fixes

* added -sf on ln util and -p flags on kali-finish-install script to safely override existing files and folders if exists. ([463bcf2](https://github.com/markjasonespelita/zyphor_os/commit/463bcf250f561e54067176abe9dcf8ec93916768))

## [0.0.29](https://github.com/markjasonespelita/zyphor_os/compare/v0.0.28...v0.0.29) (2026-04-13)


### Bug Fixes

* added contributors folder to welcome students, beginners and enthusiast enter the world of open source. ([ba6e015](https://github.com/markjasonespelita/zyphor_os/commit/ba6e015386b33cea96b7129579b47be0e503ce45))
* modified the kali-finish-install - created a symlink on the default wallpapers to the desktop-base folder. ([780dd8c](https://github.com/markjasonespelita/zyphor_os/commit/780dd8c2d0a13965df1664658e51af7b2e1b50ae))
* replace .face on the /etc/skel/.face path with more modern and precise image. ([5453bd3](https://github.com/markjasonespelita/zyphor_os/commit/5453bd317d04e064f002a8b1097cebc4e6f91c50))

## [0.0.28](https://github.com/markjasonespelita/zyphor_os/compare/v0.0.27...v0.0.28) (2026-04-11)


### Bug Fixes

* replace the kali-config/variant-xfce/includes.chroot/usr/share/backgrounds/zyphor-grub-bootloader-screensavers/grub-bootloader-screen-saver.png with much larger resolution, replace the kali-config/variant-xfce/includes.chroot/etc/skel/.face with smaller png version, and remove the override files on the xdg folder that causes xfce4-session error after login. ([60227cd](https://github.com/markjasonespelita/zyphor_os/commit/60227cda6417cd793255cc5e5f6eb44bfed4ae68))

## [0.0.27](https://github.com/markjasonespelita/zyphor_os/compare/v0.0.26...v0.0.27) (2026-04-10)


### Bug Fixes

* added a custom .face icon on the /etc/skel/.face, and modified the lightdm-gtk-greeter default-user-image = /etc/skel/.face.icon, and modified the kali finish install config that will create a symlink of the new .face icon as .face.icon. ([686ae52](https://github.com/markjasonespelita/zyphor_os/commit/686ae52d5766138526becce41bd379f01bbb76ed))

## [0.0.26](https://github.com/markjasonespelita/zyphor_os/compare/v0.0.25...v0.0.26) (2026-04-10)


### Bug Fixes

* added /doc directory for documentation. ([33c9905](https://github.com/markjasonespelita/zyphor_os/commit/33c990525e7492e437fae27d4e805c4c37570aeb))

## [0.0.25](https://github.com/markjasonespelita/zyphor_os/compare/v0.0.24...v0.0.25) (2026-04-10)


### Bug Fixes

* moved /backgrounds/zyphor image backgrounds to /backgrounds folder, added a new folder inside /backgrounds - zyphor-grub-bootloader-screensavers, mirrored the /etc/skel/conf to /etc/xdg folder, removed calamares installer as default pre-installed installer on the packages list, deleted calamares system configuration o both /etc and /usr folders, odified xfce4 desktop xml configurations - must point to /usr/share/backgrounds folder, modified kali-finish-install configuration - must apply the latest folder structure changes, modified the readme.md - must point the showcase image to /usr/share/backgrounds/zyphor-grub-bootloader-screensavers/zyphor-full.png. ([90fbc4d](https://github.com/markjasonespelita/zyphor_os/commit/90fbc4d9d1bee0f3d9eaac40b26a43b548373cc4))

## [0.0.24](https://github.com/markjasonespelita/zyphor_os/compare/v0.0.23...v0.0.24) (2026-04-09)


### Bug Fixes

* added a post install command configuration by setting up the crucial files and folders based on the zyphor configuration default settings. ([f260a06](https://github.com/markjasonespelita/zyphor_os/commit/f260a06bc5e590f006d1228d5beefd33a2bd4f1d))
* set-up all monitors to use the same Zyphor background by default. ([5b11bba](https://github.com/markjasonespelita/zyphor_os/commit/5b11bba933566b73c68e3ca6050e795618abec90))

## [0.0.23](https://github.com/markjasonespelita/zyphor_os/compare/v0.0.22...v0.0.23) (2026-04-09)


### Bug Fixes

* added boot/zyphor theme for splash screen, default grub bootleader configuration, and lightdm greeter for the default screen saver of the zyphor os. ([775e740](https://github.com/markjasonespelita/zyphor_os/commit/775e740baab1cec3f2cdcee3212eae8741e10636))

## [0.0.22](https://github.com/markjasonespelita/zyphor_os/compare/v0.0.21...v0.0.22) (2026-04-09)


### Bug Fixes

* fixed plymouth zyphor.script for plymouth display during boot and reboot, also added a zyphor folder and place the official background images inside that folder, and modified the xfce desktop xml file to display the wallpapers correctly. ([0fb60fc](https://github.com/markjasonespelita/zyphor_os/commit/0fb60fc25bb00e04b740bf3bc0c3d8529f9addbe))

## [0.0.21](https://github.com/markjasonespelita/zyphor_os/compare/v0.0.20...v0.0.21) (2026-04-09)


### Bug Fixes

* added a shortcut for the default background image by default during the desktop boot on the /usr/share/images/desktop-base/default ([ada0c3f](https://github.com/markjasonespelita/zyphor_os/commit/ada0c3f5fc769c6c3d8ce05513a133e524b2a94e))

## [0.0.20](https://github.com/markjasonespelita/zyphor_os/compare/v0.0.19...v0.0.20) (2026-04-08)


### Bug Fixes

* replace xfce with xfce4 in the /etc/skel/.config folder, and also added other configuration based on the host. ([92790d8](https://github.com/markjasonespelita/zyphor_os/commit/92790d854617b572de90eb732e9fd107349fd5f8))

## [0.0.19](https://github.com/markjasonespelita/zyphor_os/compare/v0.0.18...v0.0.19) (2026-04-08)


### Bug Fixes

* added folders for drivers and firmware list ([98e0054](https://github.com/markjasonespelita/zyphor_os/commit/98e00548fedd7b2d04ad0a73bedaf875540a7875))

## [0.0.18](https://github.com/markjasonespelita/zyphor_os/compare/v0.0.17...v0.0.18) (2026-04-08)


### Bug Fixes

* fixed plymouth settings.conf ([c3a8ba1](https://github.com/markjasonespelita/zyphor_os/commit/c3a8ba1d69a97064a1982eb1b1e048c29303e3a3))

## [0.0.17](https://github.com/markjasonespelita/zyphor_os/compare/v0.0.16...v0.0.17) (2026-04-07)


### Bug Fixes

* added plymouth theme and splash screen during boot process. ([a8179b3](https://github.com/markjasonespelita/zyphor_os/commit/a8179b311def30854a62f94b5631867efed7f2c2))

## [0.0.16](https://github.com/markjasonespelita/zyphor_os/compare/v0.0.15...v0.0.16) (2026-04-07)


### Bug Fixes

* change the default wallpapers and xfce-desktop xml configurations. ([1baf1a0](https://github.com/markjasonespelita/zyphor_os/commit/1baf1a0acd0207d2e05a673698a6846dd3084e5b))

## [0.0.15](https://github.com/markjasonespelita/zyphor_os/compare/v0.0.14...v0.0.15) (2026-04-07)


### Bug Fixes

* change menu title on live menu. ([98be193](https://github.com/markjasonespelita/zyphor_os/commit/98be19334eab308760602ffcb30e2f035580195c))
* changed grub config menu entry branding. ([1a9c9e6](https://github.com/markjasonespelita/zyphor_os/commit/1a9c9e65f785008881e0a363e071b2a18c52f957))
* changed splash screens (1200x896 and 640x480) images in pixels. ([d6cac25](https://github.com/markjasonespelita/zyphor_os/commit/d6cac258c7702c7c1929b78255b3f038cb0aa064))

## [0.0.14](https://github.com/markjasonespelita/zyphor_os/compare/v0.0.13...v0.0.14) (2026-04-07)


### Bug Fixes

* apply support on the virtual machine desktop on the /etc/xdg/xfce4/xfconf/xfce-perchannel-xml/xfce4-desktop.xml path. ([3233cb3](https://github.com/markjasonespelita/zyphor_os/commit/3233cb3bcd229c6fd6d3b4c6bf17631343f088db))

## [0.0.13](https://github.com/markjasonespelita/zyphor_os/compare/v0.0.12...v0.0.13) (2026-04-06)


### Bug Fixes

* modified the xfce4-desktop.xml, supports virtual machine desktop environment ([9011190](https://github.com/markjasonespelita/zyphor_os/commit/90111902985b9978aef2c4dbd628699870b3353a))

## [0.0.12](https://github.com/markjasonespelita/zyphor_os/compare/v0.0.11...v0.0.12) (2026-04-06)


### Bug Fixes

* removed background sub folder 'zyphor', fixed calamares branding path, change default wallpaper by renaming. ([540b767](https://github.com/markjasonespelita/zyphor_os/commit/540b7675d26611e0bfe25c1adfd42a0edb2d236e))

## [0.0.11](https://github.com/markjasonespelita/zyphor_os/compare/v0.0.10...v0.0.11) (2026-04-06)


### Bug Fixes

* added hooks/normal folder and internal files to override system package defaults ([3ae4062](https://github.com/markjasonespelita/zyphor_os/commit/3ae4062bbd364b5b1032434e8ce406ce02c46b69))

## [0.0.10](https://github.com/markjasonespelita/zyphor_os/compare/v0.0.9...v0.0.10) (2026-04-06)


### Bug Fixes

* added new wallpapers, replace the old small wallpaper, and configure the kali-config/variant-xfce/includes.chroot/etc/skel/.config/xfce/xfconf/xfce-perchannel-xml/xfce4-desktop.xml to match with the new background ([4d9cb5e](https://github.com/markjasonespelita/zyphor_os/commit/4d9cb5e8292483cbad0e79106cf8e56acbe69af8))

## [0.0.9](https://github.com/markjasonespelita/zyphor_os/compare/v0.0.8...v0.0.9) (2026-04-06)


### Bug Fixes

* removed the kali-config/variant-xfce/hooks/live/99-xfce-wallpaper.chroot file. ([5adbc57](https://github.com/markjasonespelita/zyphor_os/commit/5adbc579fe6df388108f252cd691dd4108ff3168))

## [0.0.8](https://github.com/markjasonespelita/zyphor_os/compare/v0.0.7...v0.0.8) (2026-04-06)


### Bug Fixes

* added symbolic links on crucial folders. ([1e26132](https://github.com/markjasonespelita/zyphor_os/commit/1e26132fbe6e61cc5a805f27d1f895cc5c28fdd9))

## [0.0.7](https://github.com/markjasonespelita/zyphor_os/compare/v0.0.6...v0.0.7) (2026-03-31)


### Bug Fixes

* added a zyphor-config folder, and added a xfce wallpaper configuration issue on github. ([5431969](https://github.com/markjasonespelita/zyphor_os/commit/54319695a1934f5890798f1024e3a6e047501124))

## [0.0.6](https://github.com/markjasonespelita/zyphor_os/compare/v0.0.5...v0.0.6) (2026-03-31)


### Bug Fixes

* replace everything into kali-config ([9b36a33](https://github.com/markjasonespelita/zyphor_os/commit/9b36a334b2ad86a7540ecf33637a75e4745f8a05))

## [0.0.5](https://github.com/markjasonespelita/zyphor_os/compare/v0.0.4...v0.0.5) (2026-03-31)


### Bug Fixes

* added live hooks wallpaper file chroot, and modified the xfce4-desktop.xml ([dad518f](https://github.com/markjasonespelita/zyphor_os/commit/dad518f83718393c5b402baaec3bda7d7e39477f))

## [0.0.4](https://github.com/markjasonespelita/zyphor_os/compare/v0.0.3...v0.0.4) (2026-03-31)


### Bug Fixes

* calamares installer config, logos and branding ([6c6cc57](https://github.com/markjasonespelita/zyphor_os/commit/6c6cc5704f544ca9ef121c8bd793d3931a14cfaf))

## [0.0.3](https://github.com/markjasonespelita/zyphor/compare/v0.0.2...v0.0.3) (2026-03-31)


### Bug Fixes

* added live config on the includes.chroot/etc/live. ([01bbe8d](https://github.com/markjasonespelita/zyphor/commit/01bbe8da0a3bfbce76f5e9fc98f86304c137ae19))

## [0.0.2](https://github.com/markjasonespelita/zyphor/compare/v0.0.1...v0.0.2) (2026-03-31)


### Bug Fixes

* added .releaserc.json, .releaserc.yml and CHANGELOG.md ([92c0db2](https://github.com/markjasonespelita/zyphor/commit/92c0db2be5ab5d7a5de55b69835829fa46e0b0d3))
* added ci.yml, configure background wallpapers, configure branding in bash.sh from kali to zyphor - this build config is based on kali. ([324bb28](https://github.com/markjasonespelita/zyphor/commit/324bb28e7f287255270ee2c2afd74bbcfc0922bc))
