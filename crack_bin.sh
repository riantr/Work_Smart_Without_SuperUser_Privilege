sed -i '\/LIBDIR=\/usr\/lib\/chromium\-browser\/a\$HOME\/opt\/apt_deb\/usr\/lib\/chromium\-browser' $HOME\/opt\/apt_deb\/usr\/bin\/chromium-browser
case in
chromium-browser)
;;
esac

ag preix= ~/opt/apt_deb/usr/bin | grep "/usr/"
