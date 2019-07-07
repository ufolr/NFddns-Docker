wget https://github.com/NewFuture/DDNS/archive/master.zip && \
unzip -o master.zip;
docker pull alpine;
docker pull six8/pyinstaller-alpine;
docker run --rm -e TRAVIS_TAG=0.1 -v "${PWD}/DDNS-master:/src" six8/pyinstaller-alpine --noconfirm --onefile --log-level DEBUG --clean ./.build/ddns.spec;
docker build --network host -t "ufolr/nfddns:latest" .;
rm -f master.zip && rm -r -f DDNS-master;